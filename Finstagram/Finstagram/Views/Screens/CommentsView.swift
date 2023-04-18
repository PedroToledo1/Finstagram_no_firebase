//
//  CommentsView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import SwiftUI

struct CommentsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var subimissionText: String = " "
    @State var commentArray = [commentModel]()
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                    
                }
                .padding(.trailing, 200)
            }
            HStack{
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40, alignment: .center)
                    .cornerRadius(20)
                TextField("Add a comment here...", text: $subimissionText)
            
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
            }
            .padding(.all, 6)
        }
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform:{
            getComments()
        })
    }
    func getComments(){
            print("get comments from database")
        
        let comment1 = commentModel(commentID: "", userID: "", username: "hello jhon", content: "dis iz a coment", dateCreated: Date())
        let comment2 = commentModel(commentID: "", userID: "", username: "hello javier", content: "dis iz a coment 2", dateCreated: Date())
        let comment3 = commentModel(commentID: "", userID: "", username: "hello jhon", content: "dis iz a coment 3", dateCreated: Date())
        let comment4 = commentModel(commentID: "", userID: "", username: "hello javier", content: "dis iz a coment 4", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
    }
    
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CommentsView()
        }
    }
}
