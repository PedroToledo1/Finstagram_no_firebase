//
//  UploadView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import SwiftUI

struct UploadView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.camera
                    showImagePicker.toggle()
                }, label: {
                    Text("Take photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.yellowColor)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
                .background(Color.MyTheme.purpleColor)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                }, label: {
                    Text("Upload Photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.purpleColor)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
                .background(Color.MyTheme.yellowColor)
            }

            .sheet(isPresented: $showImagePicker, onDismiss: {seguetoPostImageView()} , content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)

                    
            })
            

            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
                .shadow(radius: 12)
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $imageSelected)
                        
                })
        }
        .edgesIgnoringSafeArea(.top)
        
    }
    
    func seguetoPostImageView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            showPostImageView.toggle()}
        }

    
}


struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
