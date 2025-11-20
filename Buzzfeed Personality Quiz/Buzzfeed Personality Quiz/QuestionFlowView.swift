//
//  QuestionFlowView.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// Parent: chooses which subview to show and handles Next/Results navigation
struct QuestionFlowView: View {
    @Environment(QuizManager.self) private var quiz: QuizManager
    let question: Question

    var body: some View {
        Group {
            // Swap subviews depending on the question's response type.
            switch question.type {
            case .ranged:   RangedQuestionSubview(question: question)
            case .multiple: MultipleQuestionSubview(question: question)
            case .single:   SingleQuestionSubview(question: question)
            }
        }
        .onAppear {
            // Keep the VM's currentQuestion in sync with the navigation stack.
            if let idx = quiz.index(of: question) {
                quiz.currentQuestion = idx
            }
        }
        .navigationTitle("Question \(displayNumber) of \(quiz.questionList.count)")
        .toolbar {
            // Right-side toolbar link that moves to next question or Results when on last item.
            ToolbarItem(placement: .topBarTrailing) {
                // compute next index locally (avoids timing issues)
                let myIndex = quiz.index(of: question) ?? 0
                let nextIndex = myIndex + 1

                NavigationLink(destination: nextDestination(for: nextIndex)) {
                    Text(isLast ? "Results" : "Next").fontWeight(.semibold)
                }
                // Disable Next/Results until user has provided at least one selection for this question
                .disabled(!hasAnswered)
            }
        }
    }

    // Whether this question is the last in the flow
    private var isLast: Bool { (quiz.index(of: question) ?? 0) >= quiz.questionList.count - 1 }
    // Show a 1-based question number in the nav title
    private var displayNumber: Int { (quiz.index(of: question) ?? 0) + 1 }
    // Determine whether the user has answered this question.
    private var hasAnswered: Bool { !(quiz.selectionsByQuestion[question.id]?.isEmpty ?? true) }

    // Decide target view for NavigationLink: either the next question or the results view.
    @ViewBuilder
    private func nextDestination(for index: Int) -> some View {
        if index >= quiz.questionList.count {
            ResultsView()
        } else {
            // Guard against out-of-range access, fallback to first question if something changed.
            let safeIndex = min(max(0, index), max(quiz.questionList.count - 1, 0))
            QuestionFlowView(question: quiz.questionList[safeIndex])
        }
    }
}
