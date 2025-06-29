//
//  Tabbar.swift
//  XApp
//
//  Created by Roy on 27/5/2025.
//

import SwiftUI

struct Tabbar: View {
  @Binding var selectedTab: Tab
  @State var color: Color = .red
  @State private var tabItemWidth: CGFloat = 0

  var body: some View {
    GeometryReader { proxy in
      let hasHomeIndicator = proxy.safeAreaInsets.bottom > 20
      HStack(spacing: 0) {
        buttons
      }
      .padding(.horizontal, 8)
      .padding(.top, 14)
      .frame(height: hasHomeIndicator ? 88 : 62, alignment: .top)
      .background(
        .ultraThinMaterial,
        in: RoundedRectangle(
          cornerRadius: hasHomeIndicator ? 34 : 0, style: .continuous
        )
      )
      .background(
        background,
        alignment: .leading
      )
      .overlay(
        overlay,
        alignment: .leading
      )
      .strokeStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
      .ignoresSafeArea()
    }
  }

  var buttons: some View {
    ForEach(tabItems) { item in
      Button {
        withAnimation {
          selectedTab = item.tab
          color = item.color
        }
      } label: {
        VStack(spacing: 0) {
          Image(
            systemName:
            "\(item.icon)\(selectedTab == item.tab ? ".fill" : "")"
          )
          .font(.body.bold())
          .frame(width: 25, height: 25)
          Text(item.text)
            .font(.caption2)
            .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
      }
      .buttonStyle(PlainButtonStyle())
      .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
      .blendMode(selectedTab == item.tab ? .overlay : .normal)
      .overlay(
        GeometryReader { proxy in
          Color.clear.preference(
            key: TabPrefenceKey.self, value: proxy.size.width
          )
        }
      )
      .onPreferenceChange(TabPrefenceKey.self) { value in
        tabItemWidth = value
      }
    }
  }

  var overlay: some View {
    HStack {
      Rectangle()
        .fill(color)
        .frame(width: 28, height: 5)
        .cornerRadius(2)
        .frame(width: tabItemWidth)
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(alignment: .leading)
    }
    .padding(.horizontal, 8)
    .offset(x: Double(selectedTab.rawValue) * tabItemWidth)
  }

  var background: some View {
    HStack {
      Circle()
        .fill(color)
        .frame(width: tabItemWidth)
    }
    .padding(.horizontal, 8)
    .offset(x: Double(selectedTab.rawValue) * tabItemWidth)
  }
}

#Preview {
  Tabbar(selectedTab: .constant(.home))
}
