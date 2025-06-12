//
//  Personal.swift
//  XApp
//
//  Created by Roy on 12/6/2025.
//

import SwiftUI

struct Personal: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
      LinearGradient(
        colors: [.orange, .white], startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    )
    .ignoresSafeArea()
  }
}
