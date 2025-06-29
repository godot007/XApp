//
//  XAppApp.swift
//  XApp
//
//  Created by Roy on 23/5/2025.
//

import SwiftUI

@main
struct XAppApp: App {
  @StateObject var appModel = Model()
  var body: some Scene {
    WindowGroup {
      Launch()
        .environmentObject(appModel)
    }
  }
}
