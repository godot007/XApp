//
//  CourseItem.swift
//  XApp
//
//  Created by Roy on 18/6/2025.
//

import SwiftUI

struct CourseItem: View {
  var namespace: Namespace.ID
  @Binding var show: Bool
  var course: Course

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Spacer()
      VStack(alignment: .leading, spacing: 12) {
        Text(course.title)
          .font(.title.weight(.bold))
          .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
        Text(course.subTitle.uppercased())
          .font(.footnote.weight(.semibold))
          .foregroundStyle(.secondary)
          .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
        Text(course.text
        )
        .font(.footnote)
        .foregroundStyle(.secondary)
        .matchedGeometryEffect(id: "detail\(course.id)", in: namespace)
      }
      .padding(20)
      .background(
        Rectangle()
          .fill(.ultraThinMaterial)
          .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
          .blur(radius: 30)
          .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
      )
    }
    .frame(maxWidth: .infinity)
    .background(
      Image(course.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
    )
    .background(
      Image(course.bgImage)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
    )
    .background(
      .ultraThinMaterial,
      in: RoundedRectangle(cornerRadius: 30, style: .continuous)
    )
    .strokeStyle(cornerRadius: 30)
    .mask(
      RoundedRectangle(cornerRadius: 30, style: .continuous)
        .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
    )
    .frame(height: 300)
  }
}

#Preview {
  CourseItem(namespace: Namespace().wrappedValue, show: .constant(false), course: courses[0])
}
