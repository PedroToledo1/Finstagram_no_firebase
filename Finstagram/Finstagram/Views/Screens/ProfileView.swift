//
//  ProfileView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 15/4/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var profileDisplayName: String
    var isMyProfile: Bool
    var profileUserId: String
    var posts = PostArrayObject()
    @State var showSettings: Bool = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content:{
            ProfileHeaderView(profileDisplayName: $profileDisplayName )
            Divider()
            ImageGridview(posts: posts)
        })
        .navigationBarTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(
                                    action:{
                                        showSettings.toggle()
                                    },
                                    label:{
                                        Image(systemName: "line.horizontal.3")
                                    })
                                    .accentColor(Color.MyTheme.purpleColor)
                                    .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(isPresented: $showSettings, content: { SettingView() })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView(profileDisplayName: "Joe", isMyProfile: true, profileUserId: "")
        }
    }
}
