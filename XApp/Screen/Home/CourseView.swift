//
//  CourseView.swift
//  XApp
//
//  Created by Roy on 18/6/2025.
//

import SwiftUI

struct CourseView: View {
  var namespace: Namespace.ID
  @Binding var show: Bool
  @State var appear = [false, false, false]
  @State var viewState: CGSize = .zero
  @State var isDraggable = true
  @EnvironmentObject var model: Model
  var course: Course
  var body: some View {
    ZStack {
      ScrollView {
        cover
        content
          .offset(y: 650)
          .padding(.bottom, 700)
          .opacity(appear[2] ? 1 : 0)
      }
      .background(Color("Background"))
      .mask {
        RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous)
      }
      .coordinateSpace(name: "scroll")
      .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
      .scaleEffect(-viewState.width / 500 + 1)
      .background(.black.opacity(viewState.width / 500))
      .background(.ultraThinMaterial)
      .gesture(isDraggable ? drag : nil)
      .ignoresSafeArea()
      closeButton
        .onChange(of: show) { _ in
          if !show {
            appear[0] = false
            appear[1] = false
            appear[2] = false
          }
        }
    }
    .ignoresSafeArea()
    .onAppear {
      withAnimation(.easeOut.delay(0.2)) {
        appear[0] = true
      }
      withAnimation(.easeOut.delay(0.3)) {
        appear[1] = true
      }
      withAnimation(.easeOut.delay(0.4)) {
        appear[2] = true
      }
      model.showTab = false
    }
    .onDisappear {
      withAnimation(.closeCard) {
        model.showTab = true
      }
    }
  }

  var cover: some View {
    GeometryReader { proxy in
      let scrolly = proxy.frame(in: .named("scroll")).minY

      VStack {
        Spacer()
      }
      .frame(maxWidth: .infinity)
      .frame(height: 500)
      .foregroundStyle(.black)
      .background(
        Image(course.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding(20)
          .frame(maxWidth: 500)
          .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
          .offset(y: scrolly > 0 ? -scrolly * 0.8 : 0)
          .scaleEffect(scrolly > 0 ? 1 + scrolly / 1000 : 1)
      )
      .background(
        Image(course.bgImage)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
          .offset(y: -scrolly)
          .scaleEffect(scrolly > 0 ? 1 + scrolly / 1000 : 1)
          .blur(radius: scrolly / 50)
      )
      .mask(
        RoundedRectangle(cornerRadius: appear[0] ? 0 : 30, style: .continuous)
          .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
          .offset(y: scrolly > 0 ? -scrolly : 0)
      )
      .overlay(
        contentOverlay
          .frame(maxWidth: .infinity)
          .padding(20)
          .background(
            Rectangle()
              .fill(.ultraThinMaterial)
              .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
              )
              .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
          )
          .padding(20)
          .offset(y: 280)
          .offset(y: scrolly > 0 ? -scrolly * 0.5 : 0)
      )
    }
  }

  var closeButton: some View {
    Button {
      withAnimation(.closeCard) {
        show.toggle()
      }
    } label: {
      Image(systemName: "xmark")
        .font(.body.weight(.bold))
        .foregroundStyle(Color.secondary)
        .padding(8)
        .background(.ultraThinMaterial, in: Circle())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    .padding(20)
  }

  var content: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("英雄介绍")
        .font(.footnote.bold())
      Text(
        course.heroIntroduction
      )
      .font(.body)
      .foregroundStyle(.secondary)
      Divider().padding(.vertical, 10)
      Text("角色设定")
        .font(.footnote.bold())
      Text(course.heroPosition)
        .font(.body)
        .foregroundStyle(.secondary)
      Divider().padding(.vertical, 10)
      Text("技能使用")
        .font(.footnote.bold())
      Text(course.heroSkill)
        .font(.body)
        .foregroundStyle(.secondary)
    }
    .foregroundStyle(.primary)
    .padding(20)
  }

  var contentOverlay: some View {
    VStack(alignment: .trailing, spacing: 12) {
      Text(course.title)
        .font(.title.weight(.bold))
        .foregroundStyle(
          .linearGradient(
            colors: [.primary, .primary.opacity(0.5)],
            startPoint: .topLeading, endPoint: .bottomTrailing
          )
        )
        .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
      Text(course.subTitle.uppercased())
        .font(.footnote)
        .foregroundStyle(.secondary)
        .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
      Text(course.text)
        .font(.footnote)
        .foregroundStyle(.secondary)
        .frame(maxWidth: .infinity)
        .matchedGeometryEffect(id: "detail\(course.id)", in: namespace)
      Divider()
        .opacity(appear[0] ? 1 : 0)
      HStack {
        Image(course.avater)
          .resizable()
          .frame(width: 26, height: 26)
          .cornerRadius(20)
          .padding(8)
          .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 18, style: .continuous)
          )
          .strokeStyle(cornerRadius: 18)
        Text("\(course.author)在线手把手教学")
          .font(.footnote)
          .foregroundStyle(.secondary)
      }
      .opacity(appear[1] ? 1 : 0)
    }
  }

  var drag: some Gesture {
    DragGesture()
      .onChanged { value in
        guard value.translation.width > 0 else { return }
        if value.startLocation.x < 100 {
          withAnimation(.closeCard) {
            viewState = value.translation
          }
        }
        if value.translation.width > 180 {
          close()
        }
      }
      .onEnded { value in
        if value.translation.width > 80 {
          close()
        } else {
          withAnimation(.closeCard) {
            viewState = .zero
          }
        }
      }
  }

  func close() {
    withAnimation(.closeCard.delay(0.3)) {
      show.toggle()
    }
    withAnimation(.closeCard) {
      viewState = .zero
    }
    isDraggable = false
  }
}

#Preview {
  CourseView(
    namespace: Namespace().wrappedValue, show: .constant(true),
    course: courses[0]
  ).environmentObject(Model())
}
