//
//  AuthModal.swift
//  XApp
//
//  Created by Roy on 26/6/2025.
//

import SwiftUI

struct AuthModal: View {
  @EnvironmentObject var model: Model
  @State var viewState: CGSize = .zero
  @State var dismissed: Bool = false
  @State var appear = [false, false, false]
  var body: some View {
    ZStack {
      Color.clear.background(.regularMaterial)
        .onTapGesture {
          dismissModal()
        }
        .ignoresSafeArea()
      Group {
        switch model.authModalType {
        case .signIn: SignInView()
        case .signUp: SignUpView()
        }
      }
      .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .offset(x: viewState.width, y: viewState.height)
      .offset(y: dismissed ? 1000 : 0)
      .rotationEffect(.degrees(viewState.width / 40))
      .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0))
      .hueRotation(.degrees(viewState.width / 5))
      .gesture(drag)
      .shadow(color: Color("Background").opacity(0.2), radius: 30, x: 0, y: 30)
      .padding(20)
      .opacity(appear[0] ? 1 : 0)
      .offset(y: appear[0] ? 0 : 200)
      .background(
        Image("blueg")
          .offset(x: 80, y: 10)
          .allowsHitTesting(false)
          .opacity(appear[2] ? 1 : 0)
          .offset(y: appear[2] ? 0 : 40)
          .blur(radius: appear[2] ? 0 : 40)
      )
      Button {
        dismissModal()
      } label: {
        Image(systemName: "xmark")
          .font(.body.weight(.bold))
          .foregroundStyle(Color.secondary)
          .padding(8)
          .background(.ultraThinMaterial, in: Circle())
      }
      .frame(
        maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing
      )
      .padding(20)
      .opacity(appear[1] ? 1 : 0)
      .offset(y: appear[1] ? 0 : -100)
    }
    .onAppear {
      withAnimation(.easeOut) {
        appear[0] = true
      }
      withAnimation(.easeOut.delay(0.1)) {
        appear[1] = true
      }
      withAnimation(.easeOut(duration: 1).delay(0.2)) {
        appear[2] = true
      }
    }
  }

  var drag: some Gesture {
    DragGesture()
      .onChanged { value in
        viewState = value.translation
      }
      .onEnded { value in
        if value.translation.height > 200 {
          dismissModal()
        } else {
          withAnimation(.openCard) {
            viewState = .zero
          }
        }
      }
  }

  func dismissModal() {
    withAnimation {
      dismissed = true
    }
    withAnimation(.linear.delay(0.3)) {
      model.showAuthModal = false
    }
  }
}

#Preview {
  AuthModal().environmentObject(Model())
}
