//
//  ProfileHeaderView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 15/4/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    

    @Binding var profileDisplayName: String
    
    var body: some View {
        VStack(alignment: .center,spacing: 10, content: {
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120,height: 120,alignment: .center)
                .cornerRadius(60)
            
            Text(profileDisplayName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("this is the area where the user can add a bio to their profile")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .center, spacing: 20, content: {
                VStack(alignment: .center, spacing: 5, content: {
                    Text("5")
                        .font(.title2)
                        .fontWeight(.bold)
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20,height: 2,alignment: .center)
                    Text("post")
                        .font(.callout)
                        .fontWeight(.medium)
                    
                })
                VStack(alignment: .center, spacing: 5, content: {
                    Text("20")
                        .font(.title2)
                        .fontWeight(.bold)
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20,height: 2,alignment: .center)
                    Text("Likes")
                        .font(.callout)
                        .fontWeight(.medium)
                    
                })
            })
        })
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    
    @State static var name: String = "Joe"
    
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name)
    }
}
