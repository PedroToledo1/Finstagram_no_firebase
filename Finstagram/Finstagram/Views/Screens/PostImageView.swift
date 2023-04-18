//
//  PostImageView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @State var captionText: String = " "
    @Binding var  imageSelected: UIImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                })
                .accentColor(.primary)
                
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false, content: {
            
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipped()
                    .cornerRadius(12)
                
                TextField("add your caption here...", text: $captionText )
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
                    .font(.headline)
                    .padding(.horizontal)
                    .cornerRadius(12)
                    .autocapitalization(.sentences)
                
                
                Button(action: {
                    
                    
                    
                }, label: {
                    Text("post picture".uppercased())
                        
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(12)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                        .cornerRadius(12)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.yellowColor : Color.MyTheme.purpleColor)
                
            })
        })
    }
    
    func postPicture(){
        print("post picture to databse here")
    }
    
}

struct PostImageView_Previews: PreviewProvider {
    
    @State static var image = UIImage(named: "dog1")!
    
    static var previews: some View {
        PostImageView( imageSelected: $image)
    }
}
