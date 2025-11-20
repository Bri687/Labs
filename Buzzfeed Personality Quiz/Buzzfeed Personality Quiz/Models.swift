//
//  Models.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// -----------------------------
// Models (M in MVVM)
// -----------------------------
// A Question represents a single quiz prompt, identifies itself so it can be stored in dictionaries,
// and carries the UI-style (single, multiple, or ranged) and the available answers.
struct Question: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

// ResponseType controls which subview will be displayed for a question.
// single -> Picker-like single selection
// multiple -> several toggles (multiple selections allowed)
// ranged -> slider backed selection (chooses one of the provided answers by index)
enum ResponseType {
    case single, multiple, ranged
}

// Answer holds the visible text and the animal "result type" that this answer maps to.
// Conforming to Hashable & Identifiable lets us store Answers in Sets, Dictionaries, and SwiftUI lists.
struct Answer: Identifiable, Equatable, Hashable {
    let id = UUID()
    let text: String
    let type: Animal
}
// Animal enumerates the result types. CaseIterable lets us iterate if needed (e.g. for UI).
// Each case provides computed properties for UI-ready strings and images.
enum Animal: CaseIterable, Hashable {
    case raccoon, deer, rat, bear
    // Title displayed on the results screen.
    var title: String {
        switch self {
        case .raccoon: return "Raccoon"
        case .deer:    return "Deer"
        case .rat:     return "Rat"
        case .bear:    return "Bear"
        }
    }
    // A short personality blurb shown on the result screen.
    var blurb: String {
        switch self {
        case .raccoon:
            return "You’re curious, clever, and adaptable—resourceful in any situation and never afraid to explore something new."
        case .deer:
            return "You’re gentle, perceptive, and calm. You notice details others miss and find beauty in quiet moments."
        case .rat:
            return "You’re sharp, quick-witted, and a little mischievous. You love ideas, energy, and clever solutions."
        case .bear:
            return "You’re steady, introspective, and loyal. You value warmth, rest, and the comfort of home."
        }
    }
    // Primary asset name — place assets named like these in Assets.xcassets.
    var assetName: String {
        switch self {
        case .raccoon:  return "result_raccoon"
        case .deer:     return "result_deer"
        case .rat:      return "result_rat"
        case .bear:     return "result_bear"
        }
    }
    // A simple SwiftUI Image to use if the primary asset is missing.
    // Using Image(...) assumes these lightweight fallback images are in Assets, too.
    var fallbackImage: Image {
        switch self {
        case .raccoon: return Image("raccoon")
        case .deer:    return Image("deer")
        case .rat:     return Image("rat")
        case .bear:    return Image("bear")
        }
    }
}
