//
//  Buzzfeed_Personality_QuizApp.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 10/15/25.
//
import SwiftUI

@main
struct Buzzfeed_Personality_QuizApp: App {
    @State private var quiz = QuizManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TitleView()
            }
            .environment(quiz) // provide the QuizManager via Observation-style environment
        }
    }
}

