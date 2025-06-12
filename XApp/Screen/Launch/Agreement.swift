//
//  Agreement.swift
//  XApp
//
//  Created by Roy on 12/6/2025.
//

import SwiftUI

struct Agreement: View {
  @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
  @State var next: Bool = false
  var body: some View {
    Text("Agreement")
    Button("welcome") {
      next = true
      isFirstLaunch = false
    }
    .fullScreenCover(isPresented: $next) {
      // todo APP操作引导页（可以在这触发权限请求、初始化sdk），进入首页
      Tabbar()
    }
  }
}

#Preview {
  Agreement()
}
