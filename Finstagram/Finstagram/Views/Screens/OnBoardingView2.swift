//
//  OnBoardingView2.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import SwiftUI

struct OnBoardingView2: View {
    
    @State var displayName: String = ""
    @State var showImagePicker: Bool = false
    
    //for image picker
    
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Text("Whats your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.yellowColor)
            
            TextField("add your name here...", text: $displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
                .padding(.horizontal)
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Finish: add profile picture")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            })
            .accentColor(Color.MyTheme.purpleColor)
            .opacity(displayName != "" ? 1.0 : 0.0)
            .animation(.easeOut, value: 1.0)
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showImagePicker, onDismiss: createProfile, content: {ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)})
    }
    func createProfile() {
        print("CREATE PROFILE NOW")
    }
}

struct OnBoardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView2()
    }
}
