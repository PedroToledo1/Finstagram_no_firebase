//
//  SettingView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 16/4/23.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                
                //MARK: section 1: finstagram
                GroupBox(label: SettingLabelviews(labelText: "finstagram", labelImage: "dot.radiowaves.left.and.right"),content: {
                    
                    HStack(alignment: .center, spacing: 10, content: {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        Text("inspired in the good things of the good old instagram")
                    })
                })
                .padding()
                
                //MARK: profile
                
                GroupBox(label: SettingLabelviews(labelText: "Profile", labelImage: "Display Name"),
                         content: {
                    
                    NavigationLink(destination: SettingeditTextView(submissionText: "current name", title: "current title", description: "current description", placeholder: "placeholder"), label: {SettingRowView(leftIcon: "pencil", text: "display name", color: Color.MyTheme.purpleColor)})
                    NavigationLink(destination: SettingeditTextView(submissionText:"current bio" ,title: "profile bio", description: "change your bio", placeholder: "actual bio"), label: {SettingRowView(leftIcon: "text.quote", text: "bio", color: Color.MyTheme.purpleColor)})
                    NavigationLink(destination: SettingeditImageView(title: "profile picture", description: "your profile picture", selectedImage: UIImage(named: "dog1")!), label:{SettingRowView(leftIcon: "photo", text: "profile photo", color: Color.MyTheme.purpleColor)})
                
                
                
                SettingRowView(leftIcon: "figure.walk", text: "sign out", color: Color.MyTheme.purpleColor)
                     
            })
                
                //MARK: data
                
                GroupBox(label: SettingLabelviews(labelText: "finstagram", labelImage: "dot.radiowaves.left.and.right"),content: {
                    
                    Button(action: {
                        openCustomURLS(urlString: "https://www.google.com")
                    }, label: {
                        SettingRowView(leftIcon: "folder.fill", text: "privacyPolicy", color: Color.MyTheme.purpleColor)
                    })
                    Button(action: {
                        openCustomURLS(urlString: "https://www.yahoo.com")
                    }, label: {
                        SettingRowView(leftIcon: "folder.fill", text: "privacyPolicy", color: Color.MyTheme.purpleColor)
                    })
                    Button(action: {
                        openCustomURLS(urlString: "https://www.bing.com")
                    }, label: {
                        SettingRowView(leftIcon: "globe", text: "privacyPolicy", color: Color.MyTheme.purpleColor)
                    })
                    
                    
                    
                 
                })
                
                .padding()
                
                GroupBox{
                    Text("finstagram se creo para los que si queremos ver las fotos de los demas asi no ver solo publicidad. \n please enjoy \n esto fue creado para que todo sea mas sencillo porfa comportese")
                }
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 40)
                
               
            })
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
            Image(systemName: "xmark")
                    .font(.title2)
            })
                .accentColor(.primary)
            )
        }
    }
    
    //funciones para abrir links
    
    func openCustomURLS(urlString: String){
        guard let url = URL(string: urlString) else {return}
        
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
