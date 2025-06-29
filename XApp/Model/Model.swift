//
//  Model.swift
//  XApp
//
//  Created by Roy on 24/6/2025.
//

import Combine

class Model: ObservableObject {
  @Published var showTab = true
  @Published var showAuthModal = false
  @Published var authModalType: ModalEnum = .signIn
}

enum ModalEnum {
  case signIn
  case signUp
}
