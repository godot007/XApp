//
//  Launch.swift
//  XApp
//
//  Created by Roy on 24/5/2025.
//

import SwiftUI

struct Launch: View {
  @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
  @State private var isActiveAdv: Bool = true

  var body: some View {
    if isFirstLaunch {
      Agreement().onAppear {
        isActiveAdv = false
      }
    } else {
      ZStack(alignment: .bottom) {
        Tabbar()
        if isActiveAdv {
          Advertising()
            .onAppear {
              // 初始化sdk并请求接口初始化数据，此后隐藏splash页
              // initSDK()
              // fetchNetwork()
              DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.easeOut(duration: 1)) {
                  isActiveAdv = false
                }
              }
            }
        }
      }
    }
  }
}

#Preview {
  Launch()
}
