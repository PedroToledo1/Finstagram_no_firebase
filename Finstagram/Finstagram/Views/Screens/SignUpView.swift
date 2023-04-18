//
//  SignUpView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showOnBoarding: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Spacer()
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("you are not sign in")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("click the button below to create an account and join the fun")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Button(action: {
                showOnBoarding.toggle()
            }, label: {
                Text("Sign in/Sign Up".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            })
            .accentColor(Color.MyTheme.yellowColor)
            
            Spacer()
            Spacer()
                
        })
        .padding(.all, 6)
        .background(Color.MyTheme.yellowColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnBoarding, content: { OnBoardingView() })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
