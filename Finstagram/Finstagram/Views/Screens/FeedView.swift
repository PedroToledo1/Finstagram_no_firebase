//
//  FeedView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 12/4/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:{
            //PostView(post: post)
            LazyVStack{
                ForEach(posts.dataArray, id: \.self) {post in
                    PostView(post: post, showHeaderAndFooter: true)
                }
            }
        })
        .navigationBarTitle("Feed View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FeedView(posts: PostArrayObject())
        }
    }
}
