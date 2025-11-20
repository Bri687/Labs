//
//  Background.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// -----------------------------
// Helpers: Background modifier (View-only)
// -----------------------------
// A small ViewModifier to place a gradient behind content. Using a modifier keeps repeated UI consistent.
struct GradientBackground: ViewModifier {
    let colors: [Color]
    func body(content: Content) -> some View {
        ZStack {
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            content
        }
    }
}
extension View {
    func slideBackground(_ colors: [Color]) -> some View {
        self.modifier(GradientBackground(colors: colors))
    }
}
