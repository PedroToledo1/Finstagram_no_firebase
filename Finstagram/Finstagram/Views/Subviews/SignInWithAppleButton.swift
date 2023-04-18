//
//  SignInWithAppleButton.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
