//
//  TitleView.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// -----------------------------
// Title screen
// -----------------------------
struct TitleView: View {
    // Observation-style environment lookup
    @Environment(QuizManager.self) private var quiz: QuizManager

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            // simple SF symbol header
            Image(systemName: "pawprint.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.white)

            Text("What animal are you?")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.horizontal)

            Text("A personality quiz.")
                .font(.callout)
                .foregroundStyle(.white.opacity(0.85))
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            // Safely unwrap first question; avoids force-unwrap crash if list empty
            if let first = quiz.questionList.first {
                NavigationLink {
                    // Push the flow with the first question.
                    QuestionFlowView(question: first)
                } label: {
                    Text("Begin")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white.opacity(0.92))
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            } else {
                // Graceful degradation for an empty dataset
                Text("No questions available")
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
        // Framing/background for the whole title screen
        .slideBackground([Color.orange.opacity(0.6), Color.brown.opacity(0.7)])
    }
}
