//
//  SingleQuestionSubview.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// Single (Picker) question
struct SingleQuestionSubview: View {
    // Observation-style environment lookup
    @Environment(QuizManager.self) private var quiz: QuizManager
    let question: Question

    // Track selected index locally so the Picker UI updates immediately.
    @State private var selectedIndex: Int = 0

    var body: some View {
        Form {
            Section(header: Text(question.text).font(.headline)) {
                Picker("Choose one", selection: $selectedIndex) {
                    // Tag each row with its index so selection binds to an Int.
                    ForEach(question.answers.indices, id: \.self) { idx in
                        Text(question.answers[idx].text)
                            .tag(idx)
                            .listRowBackground(Color.clear) // keep the row clear
                    }
                }
                .pickerStyle(.inline)
                .onChange(of: selectedIndex) { newValue in
                    // Defensive: ensure index is valid before writing to the model.
                    guard question.answers.indices.contains(newValue) else { return }
                    quiz.setSingleSelection(for: question, answer: question.answers[newValue])
                }
            }
            .listRowBackground(Color.clear)
        }
        // Remove default List background so our custom gradient shows through.
        .scrollContentBackground(.hidden)
        .background {
            LinearGradient(colors: [Color.yellow.opacity(0.5), Color.green.opacity(0.4)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
        .onAppear {
            // If the question has no answers, do nothing (safe fallback).
            guard !question.answers.isEmpty else {
                selectedIndex = 0
                return
            }

            // Restore any previously selected answer from the VM.
            if let existing = quiz.selectionsByQuestion[question.id]?.first,
               let idx = question.answers.firstIndex(of: existing) {
                selectedIndex = idx
            } else {
                // Default to first answer so the question is always answered (keeps Next enabled).
                selectedIndex = 0
                quiz.setSingleSelection(for: question, answer: question.answers[0])
            }
        }
    }
}
