//
//  QuizManager.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// -----------------------------
// ViewModel (VM in MVVM): QuizManager
// - uses Observation (no Combine, no @Published)
// - contains selection & scoring logic
// -----------------------------
// Marked @MainActor because it publishes UI state and will be used from the main thread.
@MainActor
@Observable final class QuizManager {
    // This is the static dataset for the quiz. In a larger app it might be loaded from JSON.
    let questionList: [Question] = [
        Question(
            text: "What do you do when life gets stressful?",
            type: .single,
            answers: [
                Answer(text: "Pretend I’m a wizard and cast 'ignore responsibilities' spell.", type: .raccoon),
                Answer(text: "Overanalyze everything like it’s a mystery novel.", type: .deer),
                Answer(text: "Listen to sad love songs and pretend I’m in a breakup montage.", type: .rat),
                Answer(text: "Make a to-do list about fixing my to-do list.", type: .bear)
            ]
        ),
        Question(
            text: "Pick a cozy weekend vibe:",
            type: .multiple,
            answers: [
                Answer(text: "Binge a fantasy trilogy and forget what sunlight feels like.", type: .raccoon),
                Answer(text: "Watch a murder documentary while pretending I could totally solve it.", type: .deer),
                Answer(text: "Scroll Pinterest boards of romantic dates I’ll never go on.", type: .rat),
                Answer(text: "Clean the house to feel like I have control over something.", type: .bear)
            ]
        ),
        Question(
            text: "How likely are you to take an extra free item (leftovers, freebies, open snack) when nobody’s watching?",
            type: .ranged,
            answers: [
                Answer(text: "I wouldn’t — I respect what isn’t mine", type: .deer),
                Answer(text: "I might quietly help myself if I’m really hungry", type: .rat),
                Answer(text: "I’d take it and hope no one notices", type: .raccoon),
                Answer(text: "If it’s available I’ll take it and come back later for more", type: .bear)
            ]
        ),
        Question(
            text: "Your ideal main character is:",
            type: .single,
            answers: [
                Answer(text: "A chosen one with a tragic backstory.", type: .raccoon),
                Answer(text: "A detective who’s emotionally unavailable but in a hot way.", type: .deer),
                Answer(text: "A disaster romantic who keeps falling for red flags.", type: .rat),
                Answer(text: "Someone who pays taxes and calls their mom back.", type: .bear)
            ]
        ),
        Question(
            text: "Which of these matters most to you in daily life? (choose all that apply)",
            type: .multiple,
            answers: [
                Answer(text: "Not disturbing others; preserving what’s shared", type: .deer),
                Answer(text: "Finding clever/efficient ways to get things done", type: .raccoon),
                Answer(text: "Small comforts and quick wins that keep me going", type: .rat),
                Answer(text: "Big comforts, security, and reliable routines", type: .bear)
            ]
        )
    ]

    // UI-observed state (Observation tracks these properties automatically)
    // currentQuestion: the index of the question currently being displayed in the navigation flow.
    var currentQuestion: Int = 0
    // selectionsByQuestion maps a question.id (UUID) -> [Answer] to store chosen answers.
    // For single and ranged questions store one-answer arrays for consistency.
    private(set) var selectionsByQuestion: [UUID: [Answer]] = [:]

    // -----------------------------
    // Selection API (mutating model-backed selections)
    // -----------------------------
    // These functions mutate selectionsByQuestion. Keeping the update logic here keeps Views thin.
    func setSingleSelection(for question: Question, answer: Answer) {
        // Replace any previous selection for this question with the single chosen answer.
        selectionsByQuestion[question.id] = [answer]
    }

    func setMultipleSelections(for question: Question, answers: [Answer]) {
        // Sanitize input: only store answers that belong to the provided question,
        // preventing accidental cross-question selections.
        selectionsByQuestion[question.id] = answers.filter { question.answers.contains($0) }
    }

    func setRangedSelection(for question: Question, sliderIndex: Int) {
        // Clamp sliderIndex to a valid index and store the corresponding answer.
        let clamped = max(0, min(sliderIndex, question.answers.count - 1))
        selectionsByQuestion[question.id] = [question.answers[clamped]]
    }

    // helpers & business logic
    // Returns the index of a question in questionList (or nil if not found).
    func index(of question: Question) -> Int? { questionList.firstIndex(of: question) }

    // Tally selected answers and pick the top Animal. Also returns a breakdown map for diagnostics/UI.
    func calculateResults() -> (top: Animal, breakdown: [Animal: Int]) {
        var counts: [Animal: Int] = [:]
        for (_, answers) in selectionsByQuestion {
            for a in answers { counts[a.type, default: 0] += 1 }
        }

        // Determine the winner by highest count. If no answers present, default to .bear.
        let winner = counts.max(by: { $0.value < $1.value })?.key ?? .bear
        return (winner, counts)
    }

    // Reset state to allow a retake
    func reset() {
        currentQuestion = 0
        selectionsByQuestion = [:]
    }

    // Optional helper to get stored index (useful for binding the slider to the model)
    func storedIndex(for question: Question) -> Int? {
        guard let first = selectionsByQuestion[question.id]?.first else { return nil }
        return question.answers.firstIndex(of: first)
    }
}
