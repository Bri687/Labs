//
//  ResultsView.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// Results view — reads result from VM and shows artwork
struct ResultsView: View {
    @Environment(QuizManager.self) private var quiz: QuizManager

    // Compute the result on-demand from QuizManager
    private var result: (top: Animal, breakdown: [Animal: Int]) { quiz.calculateResults() }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // artwork view handles primary/fallback image selection
                GenreArtwork(type: result.top)
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)

                Text("You are a...")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)

                Text("\(result.top.title)")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.black)

                Text(result.top.blurb)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black.opacity(0.92))
                    .padding(.horizontal)

                Divider().padding(.vertical, 8)

                Button {
                    // Reset the quiz to allow a fresh retake.
                    quiz.reset()
                } label: {
                    Text("Retake Quiz")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.black.opacity(0.92))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding(.top, 24)
        }
        .slideBackground([Color.pink.opacity(0.5), Color.pink.opacity(0.1)])
    }
}
