//
//  ContentView.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 10/15/25.
//

import SwiftUI

// -----------------------------
// Previews
// -----------------------------
// Previews run in Xcode only.

#Preview("Title") {
    NavigationStack {
        TitleView()
            .environment(QuizManager())
    }
}

#Preview("Single question") {
    let vm = QuizManager()
    return NavigationStack {
        SingleQuestionSubview(question: vm.questionList[0])
            .environment(vm)
    }
}

#Preview("Results") {
    let vm = QuizManager()
    // Build a sample state so the ResultsView shows plausible content in the preview.
    vm.setSingleSelection(for: vm.questionList[0], answer: vm.questionList[0].answers[1])
    vm.setMultipleSelections(for: vm.questionList[1], answers: [vm.questionList[1].answers[0]])
    vm.setRangedSelection(for: vm.questionList[2], sliderIndex: 2)

    return NavigationStack {
        ResultsView()
            .environment(vm)
    }
}
