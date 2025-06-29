//
//  BlobView.swift
//  XApp
//
//  Created by Roy on 15/6/2025.
//

import SwiftUI

struct BlobView: View {
  @State var appear = false
  var body: some View {
    TimelineView(.animation) { timeline in
      let now = timeline.date.timeIntervalSinceReferenceDate
      let angle = Angle(degrees: now.remainder(dividingBy: 3) * 60)
      let dyn1 = cos(angle.radians)
      let angle2 = Angle(degrees: now.remainder(dividingBy: 6) * 10)
      let dyn2 = cos(angle2.radians)

      Canvas { context, size in
        context.fill(
          path(
            in: CGRect(x: 0, y: 0, width: size.width, height: size.height),
            dyn1: dyn1, dyn2: dyn2
          ),
          with: .linearGradient(
            Gradient(colors: [.pink, .blue]), startPoint: CGPoint(x: 0, y: 0),
            endPoint: CGPoint(x: 400, y: 400)
          )
        )
      }
      .frame(width: 400, height: 414)
      .rotationEffect(.degrees(appear ? 360 : 30))
    }
    .onAppear {
      withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)) {
        appear = true
      }
    }
  }

  func path(in rect: CGRect, dyn1: Double, dyn2: Double) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height

    path.move(to: CGPoint(x: 0.9923 * width, y: 0.42593 * height))
    path.addCurve(
      to: CGPoint(x: 0.6355 * width * dyn2, y: height),
      control1: CGPoint(x: 0.92554 * width * dyn2, y: 0.77749 * height * dyn2),
      control2: CGPoint(x: 0.91864 * width * dyn2, y: height)
    )
    path.addCurve(
      to: CGPoint(x: 0.08995 * width, y: 0.60171 * height),
      control1: CGPoint(x: 0.35237 * width * dyn1, y: height),
      control2: CGPoint(x: 0.2695 * width, y: 0.77304 * height)
    )
    path.addCurve(
      to: CGPoint(x: 0.34086 * width, y: 0.06324 * height * dyn1),
      control1: CGPoint(x: -0.0896 * width, y: 0.43038 * height),
      control2: CGPoint(x: 0.00248 * width, y: 0.23012 * height * dyn1)
    )
    path.addCurve(
      to: CGPoint(x: 0.9923 * width, y: 0.42593 * height),
      control1: CGPoint(x: 0.67924 * width, y: -0.10367 * height * dyn1),
      control2: CGPoint(x: 1.05906 * width, y: 0.07436 * height * dyn2)
    )
    path.closeSubpath()
    return path
  }
}

#Preview {
  BlobView()
}
