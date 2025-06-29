//
//  AvatarView.swift
//  XApp
//
//  Created by Roy on 29/6/2025.
//

import SwiftUI

struct AvatarView: View {
  var body: some View {
    AsyncImage(url: URL(string: "https://pic2.zhimg.com/v2-3f2877668b4c8f622e067b1c109f92ad_1440w.jpg"), transaction: Transaction(animation: .easeOut)) { response in
      switch response {
      case .empty:
        ProgressView()
      case let .success(image):
        image
          .resizable()
          .transition(.scale(scale: 0.5, anchor: .center))
      case .failure:
        Color.gray
      @unknown default:
        Color.gray
      }
    }
    .frame(width: 26, height: 26)
    .cornerRadius(10)
    .padding(8)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    .strokeStyle(cornerRadius: 18)
  }
}

#Preview {
  AvatarView()
}
