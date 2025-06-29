//
//  AngularButtonStyle.swift
//  XApp
//
//  Created by Roy on 25/6/2025.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize

  var cornerRadius: CGFloat {
    switch controlSize {
    case .mini:
      return 2
    case .small:
      return 6
    case .regular:
      return 10
    case .large:
      return 16
    case .extraLarge:
      return 24
    @unknown default:
      return 10
    }
  }

  var extraPadding: CGFloat {
    switch controlSize {
    case .mini:
      return 0
    case .small:
      return 2
    case .regular:
      return 4
    case .large:
      return 14
    case .extraLarge:
      return 18
    @unknown default:
      return 4
    }
  }

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.horizontal, 10 + extraPadding)
      .padding(.vertical, 4 + extraPadding)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.6)], startPoint: .top, endPoint: .bottom))
          .blendMode(.softLight)
      )
      .background(
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          .fill(.angularGradient(colors: [.pink, .purple, .blue, .pink], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 270)))
          .blur(radius: cornerRadius)
      )
      .strokeStyle(cornerRadius: cornerRadius)
  }
}

extension ButtonStyle where Self == AngularButtonStyle {
  static var angular: Self {
    return .init()
  }
}
