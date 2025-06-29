//
//  NavigationBar.swift
//  XApp
//
//  Created by Roy on 13/6/2025.
//

import SwiftUI

struct NavigationBar: View {
  var title: String
  @Binding var hasScrolled: Bool
  @State var showSearch = false
  @EnvironmentObject var model: Model
  var body: some View {
    ZStack {
      Color.clear.background(.ultraThinMaterial).blur(radius: 10).opacity(hasScrolled ? 1 : 0)
      Text(title)
        .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .padding(.top, 20)
        .offset(y: hasScrolled ? -4 : 0)
      HStack(spacing: 16) {
        Button {
          showSearch = true
        } label: {
          Image(systemName: "magnifyingglass")
            .font(.body.weight(.bold))
            .foregroundStyle(Color.secondary)
            .frame(width: 36, height: 36)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        Button {
          model.showAuthModal = true
        } label: {
          AvatarView()
        }
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
      .padding(.trailing, 20)
      .padding(.top, 20)
      .offset(y: hasScrolled ? -4 : 0)
    }
    .frame(height: hasScrolled ? 44 : 70)
    .frame(maxHeight: .infinity, alignment: .top)
    .sheet(isPresented: $showSearch) {
      SearchView()
    }
  }
}

#Preview {
  NavigationBar(title: "Home", hasScrolled: .constant(false))
    .environmentObject(Model())
}
