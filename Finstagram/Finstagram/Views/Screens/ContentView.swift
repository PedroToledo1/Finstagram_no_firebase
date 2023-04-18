//
//  ContentView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 12/4/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var currentUserID: String? = nil
    
    var body: some View{
        TabView{
            NavigationView{
                //FeedView()
                FeedView(posts: PostArrayObject())
            }
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            NavigationView{
                BrowseView()
            }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("browse")
                }
            UploadView()
                .tabItem{
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            ZStack{
                
                if currentUserID != nil {
                    NavigationView{
                        ProfileView(profileDisplayName: "My profile", isMyProfile: true, profileUserId: " ")
                    }
                }else {
                    SignUpView()
                }
                
                
                
            }
            
            
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
