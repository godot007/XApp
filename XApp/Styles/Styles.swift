//
//  Styles.swift
//  XApp
//
//  Created by Roy on 13/6/2025.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
  var cornerRadius: CGFloat
  @Environment(\.colorScheme) var colorScheme
  func body(content: Content) -> some View {
    content.overlay(
      RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        .stroke(
          .linearGradient(
            colors: [
              .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
              .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .blendMode(.overlay)
    )
  }
}

extension View {
  func strokeStyle(cornerRadius: CGFloat) -> some View {
    modifier(StrokeStyle(cornerRadius: cornerRadius))
  }
}
