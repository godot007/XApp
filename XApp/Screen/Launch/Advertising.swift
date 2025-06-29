//
//  Advertising.swift
//  XApp
//
//  Created by Roy on 25/5/2025.
//

import SwiftUI

struct Advertising: View {
  var body: some View {
    VStack {
      Color.clear
        .contentShape(Rectangle())
        .allowsHitTesting(true)
      VStack {
        VStack {
          Circle()
            .strokeBorder(.white, lineWidth: 1)
            .background(
              Image("defAvater")
                .resizable()
                .frame(width: 36, height: 36)
                .cornerRadius(20)
                .padding(8)
                .background(
                  .ultraThinMaterial,
                  in: RoundedRectangle(cornerRadius: 18, style: .continuous)
                )
            )
            .background(Circle().fill(Color.blue))
            .frame(width: 120, height: 120)
          Label {
            Text("loading...")
              .font(.body.weight(.semibold))
              .foregroundStyle(.primary)
          } icon: {
            Image(systemName: "airplane.arrival")
          }
          .padding()
        }
        .offset(y: -60)
        Text(
          "广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位广告位"
        )
        .font(.footnote)
        .foregroundStyle(Color.secondary)
        .padding(.horizontal, 20)
        .multilineTextAlignment(.center)
        .offset(y: -30)
        Text("Contact me: clq3000@126.com")
          .font(.system(size: 14).weight(.semibold))
          .foregroundStyle(Color.secondary)
          .padding(.bottom, 12)
      }
      .frame(maxWidth: .infinity)
      .background(Color("Background"))
      .frame(maxHeight: .infinity, alignment: .bottom)
    }
  }
}

#Preview {
  Advertising()
}
