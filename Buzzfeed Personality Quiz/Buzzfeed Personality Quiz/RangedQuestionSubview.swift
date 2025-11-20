//
//  RangedQuestionSubview.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// Ranged (Slider) question
struct RangedQuestionSubview: View {
    @Environment(QuizManager.self) private var quiz
    let question: Question

    // sliderValue maps to discrete indices (0..count-1). Slider uses Double binding.
    @State private var sliderValue: Double = 0

    var body: some View {
        VStack(spacing: 24) {
            Text(question.text)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)

            VStack(spacing: 16) {
                // Show the first/last labels to explain the slider extremes.
                HStack {
                    Text(question.answers.first?.text ?? "")
                    Spacer()
                    Text(question.answers.last?.text ?? "")
                }
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.85))

                // Slider steps by 1 so it snaps to each answer index.
                Slider(value: $sliderValue, in: 0...Double(maxIndex), step: 1)
                    .tint(.white)
                    .onChange(of: sliderValue) { newValue in
                        // Round to nearest index and update the VM.
                        let idx = Int(round(newValue))
                        quiz.setRangedSelection(for: question, sliderIndex: idx)
                    }

                // Show the currently-selected answer's short text.
                Text("Selected: \(currentAnswer.text)")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal)

            Spacer()
        }
        .slideBackground([Color.purple.opacity(0.6), Color.indigo.opacity(0.6)])
        .onAppear {
            // If there's an existing saved answer, set the slider to its index.
            if let saved = quiz.selectionsByQuestion[question.id]?.first,
               let idx = question.answers.firstIndex(of: saved) {
                sliderValue = Double(idx)
            } else {
                // Default to the middle option to provide a neutral default.
                sliderValue = Double(maxIndex / 2)
                // Persist that default selection so the flow treats the question as answered.
                quiz.setRangedSelection(for: question, sliderIndex: Int(sliderValue))
            }
        }
    }

    // Helper: last valid index in the answers array.
    private var maxIndex: Int { max(0, question.answers.count - 1) }

    // Return the currently-selected Answer according to the slider value (safely clamped).
    private var currentAnswer: Answer {
        let idx = Int(round(sliderValue))
        return question.answers[min(maxIndex, max(0, idx))]
    }
}
