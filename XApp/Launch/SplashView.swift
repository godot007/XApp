//
//  SplashView.swift
//  XApp
//
//  Created by Roy on 25/5/2025.
//

import SwiftUI

struct SplashView: View {
  
  @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
  
  var body: some View {
    VStack {
      Spacer()
      VStack {
        Circle()
          .strokeBorder(.white, lineWidth: 2)
          .background(Circle().fill(Color.blue))
          .frame(width: 120, height: 120)
          .offset(y: -60)
        
        if isFirstLaunch {
          Button("check persession") {
            print("checking...")
          }
          .buttonStyle(.borderedProminent)
        }
        
        Text("clq3000@126.com")
          .tint(.primary)
          .padding(.top, 52)
          .padding(.bottom, 60)
      }
      .frame(maxWidth: .infinity)
      .background(.white)
    }
  }
}

#Preview {
  SplashView()
}

