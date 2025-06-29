//
//  Home.swift
//  XApp
//
//  Created by Roy on 29/5/2025.
//

import SwiftUI

struct Home: View {
  @State var hasScrolled = false
  @State var show = false
  @Namespace var namespace
  @State var showStatusBar = true
  @State var selectionID = UUID()
  @State var showCourse = false
  @State var courseIndex = 0
  @EnvironmentObject var model: Model
  var body: some View {
    ZStack {
      ScrollView {
        Color.clear.overlay {
          GeometryReader { proxy in
            Color.clear.preference(
              key: ScrollPreferenceKey.self,
              value: proxy.frame(in: .named("scroll")).minY
            )
          }
        }.frame(height: 0)
        TabView {
          ForEach(Array(featureCourses.enumerated()), id: \.offset) { index, course in
            GeometryReader { proxy in
              let offsetX = proxy.frame(in: .global).minX
              FeatureCourseItem(featureCourse: course)
                .padding(.vertical, 40)
                .frame(maxWidth: 500)
                .frame(maxWidth: .infinity)
                .rotation3DEffect(
                  .degrees(offsetX / -15), axis: (x: 0, y: 1, z: 0)
                )
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 10)
                .blur(radius: abs(offsetX / 80))
                .overlay {
                  Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 210)
                    .offset(x: 50, y: -120)
                    .offset(x: offsetX)
                }
                .onTapGesture {
                  showCourse = true
                  courseIndex = index
                }
            }
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
          Image("blueg")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 500, height: 500)
        )
        Text("Course".uppercased())
          .font(.body.weight(.semibold))
          .foregroundStyle(.secondary)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
          .padding(.horizontal, 20)
        LazyVGrid(
          columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20
        ) {
          if !show {
            cards
          } else {
            ForEach(courses) { _ in
              VStack {}.frame(height: 300)
            }
          }
        }
        .padding(.horizontal, 20)
      }
      .coordinateSpace(name: "scroll")
      .onPreferenceChange(
        ScrollPreferenceKey.self,
        perform: { value in
          withAnimation(.easeInOut) {
            hasScrolled = value < 0
          }
        }
      )
      .safeAreaInset(
        edge: .top,
        content: {
          Color.clear.frame(height: 70)
        }
      )
      .overlay {
        NavigationBar(title: "Home", hasScrolled: $hasScrolled)
      }
      if show {
        detail
      }
    }
    .statusBarHidden(showStatusBar)
    .onChange(
      of: show,
      perform: { newValue in
        if newValue {
          withAnimation(.closeCard) {
            showStatusBar = true
          }
        } else {
          withAnimation(.openCard) {
            showStatusBar = false
          }
        }
      }
    )
    .safeAreaInset(edge: .bottom) {
      Color.clear.frame(height: 62)
    }
    .sheet(isPresented: $showCourse) {
      CourseView(namespace: namespace, show: $showCourse, course: featureCourses[courseIndex])
    }
  }

  var cards: some View {
    ForEach(courses) { course in
      CourseItem(namespace: namespace, show: $show, course: course)
        .onTapGesture {
          withAnimation(.openCard) {
            show.toggle()
            model.showTab = false
            selectionID = course.id
          }
        }
    }
  }

  var detail: some View {
    ForEach(courses) { course in
      if course.id == selectionID {
        CourseView(namespace: namespace, show: $show, course: course)
          .zIndex(1)
          .transition(
            .asymmetric(
              insertion: .opacity.animation(.easeInOut(duration: 0.1)),
              removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.3))
            )
          )
      }
    }
  }
}

#Preview {
  Home().environmentObject(Model())
}
