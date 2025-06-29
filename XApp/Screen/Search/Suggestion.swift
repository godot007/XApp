//
//  Suggestion.swift
//  XApp
//
//  Created by Roy on 23/6/2025.
//

import Foundation

struct Suggestion: Identifiable {
  var id = UUID()
  var text: String
}

let suggestions = [
  Suggestion(text: "橘右京"),
  Suggestion(text: "后羿"),
  Suggestion(text: "狄仁杰"),
  Suggestion(text: "公孙离")
]
