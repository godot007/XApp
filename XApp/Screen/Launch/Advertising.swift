//
//  Advertising.swift
//  XApp
//
//  Created by Roy on 25/5/2025.
//

import SwiftUI

struct Advertising: View {
  var body: some View {
    VStack {
      Circle()
        .strokeBorder(.white, lineWidth: 2)
        .background(Circle().fill(Color.blue))
        .frame(width: 120, height: 120)
        .offset(y: -60)
      Label {
        Text("loading...")
      } icon: {
        Image(systemName: "loading")
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

#Preview {
  Advertising()
}
