//
//  ImageGridview.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import SwiftUI

struct ImageGridview: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())],
                  alignment: .center, spacing: nil,pinnedViews: [], content: {
            ForEach(posts.dataArray, id: \.self) { post in
                NavigationLink(destination:
                                FeedView(posts: PostArrayObject(post: post)),
                               label:{
                    PostView(post: post, showHeaderAndFooter: false)})
            }
            
        })
    }
}

struct ImageGridview_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridview(posts: PostArrayObject())
    }
}
