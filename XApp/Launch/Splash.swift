//
//  Splash.swift
//  XApp
//
//  Created by Roy on 24/5/2025.
//

import SwiftUI

struct Splash: View {
  @State private var isActive = false
  @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    var body: some View {
      ZStack {
        ContentView()
        if isActive {
          
        } else {
          SplashView()
          .ignoresSafeArea()
        }
      }
      .onAppear {
        // todo 是否首次安装打开，如首次打开，直接加载app内启动资源页，结束后检测权限并初始化sdk此后隐藏splash页；非首次打开则初始化sdk并请求接口初始化数据，此后隐藏splash页
        if isFirstLaunch {
          
        } else {
          // initSDK()
          // fetchNetwork()
          isActive = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
          withAnimation(.easeOut(duration: 1)) {
            isActive = true
          }
        }
      }
    }
}

#Preview {
  Splash()
}
