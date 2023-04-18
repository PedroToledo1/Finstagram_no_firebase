//
//  SettingeditTextView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import SwiftUI

struct SettingeditTextView: View {
    
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    
    var body: some View {
        VStack{
            HStack{
                Text(description)
                Spacer(minLength: 0)
            }
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height: 60)
                .background(Color.MyTheme.beigeColor)
                .font(.headline)
                .autocapitalization(.sentences)
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

struct SettingeditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingeditTextView(title: "test title", description: "test description", placeholder: "test placeholder")
        }
    }
}
