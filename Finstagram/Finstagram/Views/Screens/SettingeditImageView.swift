//
//  SettingeditImageView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import SwiftUI

struct SettingeditImageView: View {

    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage // image show on this screen
    @State var showImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text(description)
                Spacer(minLength: 0)
            }
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200,height: 200)
                .cornerRadius(12)
                .clipped()
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Import")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
            })
            .accentColor(Color.MyTheme.purpleColor)
            
            .sheet(isPresented: $showImagePicker, content:{ ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)})
            
            Button(action: {
                
            }, label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
            })
            .accentColor(Color.MyTheme.yellowColor)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationBarTitle(title)
    }
}
struct SettingeditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingeditImageView(title: "title", description: "description", selectedImage: UIImage(named: "dog1")!)
        }
    }
}
