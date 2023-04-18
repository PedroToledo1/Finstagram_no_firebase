//
//  PostArrayObject.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 12/4/23.
//

import Foundation

class PostArrayObject: ObservableObject{
    @Published var dataArray = [PostModel]()
    
    init() {
        print("FECTH FROM DATA BASE")
        
        let post1 = PostModel(postID: "", userID: "", username: "funciona", caption: "this is a caption", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "bastante", caption: "this is a caption", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "bien", caption: "this is a caption", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "seeeee", caption: "this is a caption", dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
        
    
    /// used for single post selection 
    init(post: PostModel){
            self.dataArray.append(post)
        }
}
