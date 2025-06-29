//
//  FeatureCourseItem.swift
//  XApp
//
//  Created by Roy on 13/6/2025.
//

import SwiftUI

struct FeatureCourseItem: View {
  var featureCourse: Course
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Spacer()
      Image("wzry")
        .resizable(resizingMode: .stretch)
        .aspectRatio(contentMode: .fit)
        .frame(width: 26, height: 26)
        .padding(9)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .strokeStyle(cornerRadius: 16)
      Text(featureCourse.title)
        .font(.largeTitle.bold())
        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
      Text(featureCourse.subTitle.uppercased())
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundStyle(.secondary)
      Text(featureCourse.text)
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.secondary)
    }
    .padding(.all, 20)
    .padding(.vertical, 20)
    .frame(height: 350)
    .background(.ultraThinMaterial)
    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .strokeStyle(cornerRadius: 30)
    .padding(.horizontal, 20)
  }
}

#Preview {
  FeatureCourseItem(featureCourse: featureCourses[0])
}
