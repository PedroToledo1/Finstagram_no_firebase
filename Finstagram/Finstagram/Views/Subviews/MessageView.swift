//
//  MessageView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: commentModel
    
    var body: some View {
        HStack{
            //MARK: profile image
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4, content:{
                
                //MARK: username
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
                //MARK: comment
                Text(comment.content)
                    .padding(.all, 6)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
            })
        }
        
    }
}

struct MessageView_Previews: PreviewProvider {
    
    static var comment: commentModel = commentModel(commentID: "", userID: "", username: "prueba", content: "really cool", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
    }
}
