//
//  GenreArtwork.swift
//  Buzzfeed Personality Quiz
//
//  Created by Aubriel Williams on 11/11/25.
//
import SwiftUI

// Artwork view: tries primary asset name first, then fallback image
// Using UIImage(named:) is a runtime check for an asset — if missing, shows a simpler fallback.
struct GenreArtwork: View {
    let type: Animal
    var body: some View {
        Group {
            if let ui = UIImage(named: type.assetName) {
                // Primary: full-bleed hero image (scaledToFill)
                Image(uiImage: ui)
                    .resizable()
                    .scaledToFill()
            } else {
                // Fallback: smaller, contained illustration with padding to preserve layout.
                type.fallbackImage
                    .resizable()
                    .scaledToFit()
                    .padding(24)
            }
        }
        .shadow(radius: 5)
    }
}
