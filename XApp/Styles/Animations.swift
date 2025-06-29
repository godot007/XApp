//
//  Animations.swift
//  XApp
//
//  Created by Roy on 18/6/2025.
//

import SwiftUI

extension Animation {
  static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
  static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.8)
}
