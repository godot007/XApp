//
//  SearchView.swift
//  XApp
//
//  Created by Roy on 20/6/2025.
//

import SwiftUI

struct SearchView: View {
  @State var searchKey = ""
  @State var show = false
  @State var selectIndex: Int = 1
  @Environment(\.presentationMode) var presentationMode
  @Namespace var nameSpace
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          content
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .background(
          Rectangle()
            .fill(.regularMaterial)
            .frame(height: 200)
            .frame(maxHeight: .infinity, alignment: .top)
            .blur(radius: 30)
            .offset(y: -200)
        )
        .background(Image("blueg").offset(x: -80, y: -200))
      }
      .navigationTitle("Search")
      .searchable(
        text: $searchKey,
        placement: .navigationBarDrawer(displayMode: .always),
        prompt: Text("公孙离、后羿")
      ) {
        ForEach(suggestions) { suggestion in
          Button {
            searchKey = suggestion.text
          } label: {
            Text(suggestion.text)
              .searchCompletion(suggestion.text)
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarItems(
        trailing: Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Done")
            .bold()
            .foregroundStyle(Color.secondary)
        })
      .sheet(isPresented: $show) {
        CourseView(namespace: nameSpace, show: $show, course: courses[selectIndex])
      }
    }
  }

  var content: some View {
    ForEach(Array(courses.enumerated()), id: \.offset) { index, item in
      if item.title.contains(searchKey) || searchKey == "" {
        if index != 0 { Divider() }
        HStack(alignment: .top, spacing: 12) {
          Image(item.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 44, height: 44)
            .background(Color("Background"))
            .mask(Circle())
          VStack(alignment: .leading, spacing: 4) {
            Text(item.title).bold()
            Text(item.text)
              .font(.footnote)
              .foregroundStyle(Color.secondary)
              .frame(maxWidth: .infinity, alignment: .leading)
              .multilineTextAlignment(.leading)
          }
        }
        .padding(.vertical, 4)
        .listRowSeparator(.hidden)
        .onTapGesture {
          show = true
          selectIndex = index
        }
      }
    }
  }
}

#Preview {
  SearchView()
}
