//
//  BrowseView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import SwiftUI

struct BrowseView: View {
    
    var posts = PostArrayObject()
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false, content:{
            CarouselView()
            ImageGridview(posts: posts)
        })
        .navigationBarTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BrowseView()
        }
    }
}
