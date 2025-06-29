//
//  Agreement.swift
//  XApp
//
//  Created by Roy on 12/6/2025.
//

import SwiftUI

struct Agreement: View {
  @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
  var body: some View {
    VStack {
      Text("Agreement").font(.system(size: 24).bold())
      ScrollView {
        Text(
          "这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本这是协议文本"
        )
        .font(.system(size: 16))
        .foregroundStyle(Color.secondary)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.leading)
        .padding(.horizontal, 16)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      HStack {
        Button {} label: {
          Text("拒绝")
            .font(.system(size: 20))
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color.gray, in: RoundedRectangle(cornerRadius: 10))
        }
        Button {
          isFirstLaunch = false
        } label: {
          Text("同意")
            .font(.system(size: 20))
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color.blue, in: RoundedRectangle(cornerRadius: 10))
        }
      }
      .padding(.horizontal, 20)
    }
  }
}

#Preview {
  Agreement()
}
