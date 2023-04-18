//
//  OnBoardingView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnBoardingPart2: Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 10)
            Text("Welcome to finstagram. algo algo algo algo alog alog")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
                .padding()
            Button(action: {
                showOnBoardingPart2.toggle()
            }, label: {
                SignInWithAppleButton()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
            Button(action: {
                showOnBoardingPart2.toggle()
            }, label: {
                HStack{
                    Image(systemName: "globe")
                    Text("sign in with google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(.sRGB, red: 222/225, green: 82/255, blue: 70/225, opacity: 1.0))
                .cornerRadius(4)
                .font(.system(size: 23, weight: .medium, design: .default))
            })
            .accentColor(Color.white)
            
            Button(action:{presentationMode.wrappedValue.dismiss()} , label: {Text("Continue as a guest")})
            
        }
        .padding(.all, 20)
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .fullScreenCover(isPresented: $showOnBoardingPart2, content: {OnBoardingView2()})
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
