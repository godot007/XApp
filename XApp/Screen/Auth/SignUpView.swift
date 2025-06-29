//
//  SignUpView.swift
//  XApp
//
//  Created by Roy on 25/6/2025.
//

import SwiftUI

struct SignUpView: View {
  enum Field: Hashable {
    case email
    case password
  }

  @State var email: String = ""
  @State var passwd: String = ""
  @FocusState var focusedField: Field?
  @State var circleY: CGFloat = 0
  @State var circleColor: Color = .blue
  @State var emailFieldY: CGFloat = 0
  @State var passwordFieldY: CGFloat = 0
  @State var appear = [false, false, false]
  @EnvironmentObject var model: Model
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Sign Up")
        .font(.largeTitle.bold())
        .opacity(appear[0] ? 1 : 0)
        .offset(y: appear[0] ? 0 : 20)
      Text("王者知识库，在这里找到更多游戏资源，结交更多游戏好友。")
        .font(.headline)
        .fixedSize(horizontal: false, vertical: true)
        .opacity(appear[1] ? 1 : 0)
        .offset(y: appear[1] ? 0 : 20)
      Group {
        TextField("Email", text: $email)
          .inputStyle(icon: "mail")
          .textContentType(.emailAddress)
          .keyboardType(.emailAddress)
          .autocapitalization(.none)
          .autocorrectionDisabled()
          .focused($focusedField, equals: .email)
          .shadow(
            color: focusedField == .email ? .primary.opacity(0.3) : .clear,
            radius: 10, x: 0, y: 3
          )
          .overlay(geometry)
          .onPreferenceChange(
            CirclePreferenceKey.self,
            perform: { value in
              print("xxx\(emailFieldY), \(value)")
              //              if emailFieldY == 0 {
              //                print("xxxx\(emailFieldY), \(value)")
              emailFieldY = value
              circleY = value
              //              }
            }
          )
        SecureField("Password", text: $passwd)
          .inputStyle(icon: "lock")
          .textContentType(.password)
          .focused($focusedField, equals: .password)
          .shadow(
            color: focusedField == .password ? .primary.opacity(0.3) : .clear,
            radius: 10, x: 0, y: 3
          )
          .overlay(geometry)
          .onPreferenceChange(
            CirclePreferenceKey.self,
            perform: { value in
              print("xxx\(passwordFieldY), \(value)")
              //              if passwordFieldY == 0 {
              //                print("xxxx\(passwordFieldY), \(value)")
              passwordFieldY = value
              //              }
            }
          )
        Button {} label: {
          Text("Create an account")
            .frame(maxWidth: .infinity)
        }
        .font(.headline)
        .blendMode(.overlay)
        .buttonStyle(.angular)
        .tint(.accentColor)
        .controlSize(.large)
        .shadow(
          color: Color("Background").opacity(0.2), radius: 30, x: 0, y: 30
        )
        Group {
          Text("By clicking on ")
            + Text("_create an account_").foregroundColor(.primary.opacity(0.7))
            + Text(
              ", you agree to our **Terms of Service** and **[Privacy Policy](https://apple.com)**"
            )
          Divider()
          HStack {
            Text("Already have an account?")
            Button {
              model.authModalType = .signIn
            } label: {
              Text("**Sign in**")
            }
          }
        }
        .font(.footnote)
        .accentColor(.secondary)
        .foregroundStyle(Color.secondary)
        .fixedSize(horizontal: false, vertical: true)
      }
      .opacity(appear[2] ? 1 : 0)
      .offset(y: appear[2] ? 0 : 20)
    }
    .padding(20)
    .background(
      .ultraThinMaterial,
      in: RoundedRectangle(cornerRadius: 30, style: .continuous)
    )
    .background(
      Circle().fill(circleColor)
        .frame(width: 68, height: 68)
        .frame(
          maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading
        )
        .offset(y: circleY)
    )
    .coordinateSpace(name: "container")
    .strokeStyle(cornerRadius: 30)
    .onChange(
      of: focusedField,
      perform: { value in
        withAnimation {
          if value == .password {
            circleColor = .red
            circleY = passwordFieldY
          } else {
            circleColor = .blue
            circleY = emailFieldY
          }
        }
      }
    )
    .onAppear {
      withAnimation(.spring().delay(0.1)) {
        appear[0] = true
      }
      withAnimation(.spring().delay(0.2)) {
        appear[1] = true
      }
      withAnimation(.spring().delay(0.3)) {
        appear[2] = true
      }
    }
  }

  var geometry: some View {
    GeometryReader { proxy in
      Color.clear.preference(
        key: CirclePreferenceKey.self,
        value: proxy.frame(in: .named("container")).minY
      )
    }
  }
}

#Preview {
  SignUpView().environmentObject(Model())
}
