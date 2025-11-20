//
//  MultipleQuestionSubview.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// Multiple (Toggles) question — dynamic number of toggles
struct MultipleQuestionSubview: View {
    @Environment(QuizManager.self) private var quiz: QuizManager
    let question: Question

    // Dynamic toggle state per answer
    @State private var toggles: [Bool] = []

    var body: some View {
        Form {
            Section(header: Text(question.text).font(.headline)) {
                // Build toggles dynamically for however many answers the question has.
                ForEach(question.answers.indices, id: \.self) { idx in
                    Toggle(question.answers[idx].text,
                           isOn: Binding(
                                get: { toggles.indices.contains(idx) ? toggles[idx] : false },
                                set: { newValue in
                                    ensureTogglesInitialized()
                                    toggles[idx] = newValue
                                    commit()
                                }
                           )
                    )
                    .listRowBackground(Color.clear)
                }
            }
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .background {
            LinearGradient(colors: [Color.orange.opacity(0.4), Color.pink.opacity(0.4)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
        .onAppear {
            ensureTogglesInitialized() // initialize toggles for this question
            // Restore toggles from VM selections.
            let restored = quiz.selectionsByQuestion[question.id] ?? []
            for idx in question.answers.indices {
                let answer = question.answers[idx]
                toggles[idx] = restored.contains(answer)
            }
            // Write back the restored state so the VM has a normalized/filtered value.
            commit()
        }
    }

    // Ensure the toggles array has the right size for the question answers.
    private func ensureTogglesInitialized() {
        if toggles.count != question.answers.count {
            toggles = Array(repeating: false, count: question.answers.count)
        }
    }

    // An array of currently-selected answers in the order the question defines.
    private var selectedAnswers: [Answer] {
        var arr: [Answer] = []
        for idx in question.answers.indices where toggles.indices.contains(idx) && toggles[idx] {
            arr.append(question.answers[idx])
        }
        return arr
    }

    // Push local toggle state into the QuizManager
    private func commit() {
        quiz.setMultipleSelections(for: question, answers: selectedAnswers)
    }
}
