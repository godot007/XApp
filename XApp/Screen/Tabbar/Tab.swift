//
//  Tab.swift
//  XApp
//
//  Created by Roy on 29/5/2025.
//

import SwiftUI

enum Tab: Int {
  case home = 0
  case components
  case router
  case personal
}

struct TabItem: Identifiable {
  var id = UUID()
  var text: String
  var icon: String
  var tab: Tab
  var color: Color
}

var tabItems = [
  TabItem(text: "Home", icon: "house", tab: .home, color: .red),
  TabItem(text: "Components", icon: "book", tab: .components, color: .green),
  TabItem(text: "Router", icon: "paperplane", tab: .router, color: .blue),
  TabItem(text: "Personal", icon: "person", tab: .personal, color: .orange)
]

struct TabPrefenceKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
