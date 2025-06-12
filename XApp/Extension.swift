//
//  Extension.swift
//  XApp
//
//  Created by Roy on 30/5/2025.
//

import SwiftUI

extension View {
  func getSafeAreaInsets(_ bottom: Binding<CGFloat>) -> some View {
    background(
      GeometryReader { proxy in
        Color.clear
          .onAppear {
            bottom.wrappedValue = proxy.safeAreaInsets.bottom
          }
      })
  }
}
