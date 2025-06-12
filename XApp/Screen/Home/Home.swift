//
//  Home.swift
//  XApp
//
//  Created by Roy on 29/5/2025.
//

import SwiftUI

struct Home: View {
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
        colors: [.red, .green], startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    )
    .ignoresSafeArea()
  }
}

#Preview {
  Home()
}
