//
//  TabContainer.swift
//  XApp
//
//  Created by Roy on 24/6/2025.
//

import SwiftUI

struct TabContainer: View {
  @State var selectedTab: Tab = .home
  @EnvironmentObject var model: Model
  var body: some View {
    ZStack {
      Group {
        switch selectedTab {
        case .home: Home()
        case .game: GameView()
        case .community: CommunityView()
        case .personal: Personal()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      Tabbar(selectedTab: $selectedTab)
        .offset(y: model.showTab ? 0 : 200)

      if model.showAuthModal {
        AuthModal()
          .zIndex(1)
      }
    }
  }
}

#Preview {
  TabContainer().environmentObject(Model())
}
