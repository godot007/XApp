//
//  Personal.swift
//  XApp
//
//  Created by Roy on 12/6/2025.
//

import SwiftUI

struct Personal: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
              .symbolRenderingMode(.palette)
              .foregroundStyle(.blue, .blue.opacity(0.3))
              .padding()
              .font(.system(size: 32))
              .background(Circle().fill(.ultraThinMaterial))
              .background(
                Image(systemName: "hexagon.fill")
                  .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                  .font(.system(size: 200))
                  .offset(x: -50, y: -100)
              )
              .background(
                BlobView()
                  .offset(x: 200)
                  .scaleEffect(0.6)
              )
            Text("Roy")
              .font(.title.weight(.semibold))
            HStack {
              Image(systemName: "location")
                .imageScale(.medium)
                .foregroundStyle(.secondary)
              Text("Guangzhou China")
                .foregroundStyle(.secondary)
            }
          }
          .frame(maxWidth: .infinity)
          .padding()
        }
        Section {
          NavigationLink { Text("settings") } label: {
            Label("Settings", systemImage: "gear")
          }
          NavigationLink { Text("Billing") } label: {
            Label("Billing", systemImage: "creditcard")
          }
          NavigationLink { Text("Help") } label: {
            Label("Help", systemImage: "questionmark.circle")
          }
        }
        .foregroundStyle(.primary)
        .listRowSeparator(.hidden)
        Section {
          // swiftlint:disable:next force_unwrapping
          Link(destination: URL(string: "https://apple.com")!) {
            HStack {
              Label("Apple", systemImage: "applelogo")
              Spacer()
              Image(systemName: "link").foregroundStyle(.secondary)
            }
          }
          // swiftlint:disable:next force_unwrapping
          Link(destination: URL(string: "https://github.com")!) {
            HStack {
              Label {
                Text("Github")
              } icon: {
                Image("github")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 32)
              }
              Spacer()
              Image(systemName: "link").foregroundStyle(.secondary)
            }
          }
        }
        .foregroundStyle(.primary)
        .listRowSeparator(.hidden)
      }
      .listStyle(.insetGrouped)
      .navigationTitle("Peronal")
    }
  }
}

#Preview {
  Personal()
}
