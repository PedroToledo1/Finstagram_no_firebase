//
//  PostView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 12/4/23.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    @State var postImage: UIImage = UIImage(named: "dog1")!
    @State var animateLike: Bool = false
    @State var showActionsheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption{
        case general
        case reporting
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            if showHeaderAndFooter {
                
                // MARK: header
                
                HStack{
                    
                    NavigationLink(
                        destination: ProfileView(profileDisplayName: post.username, isMyProfile: false, profileUserId: post.userID),
                        label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30,alignment: .center)
                            .cornerRadius(15)
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    })
                    
                    
                    Spacer()
                    
                    Button(action: {
                        showActionsheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionsheet, content: {
                        getActionSheet()
                    })
                }
                .padding(.all, 6)
            }
            //MARK: image
            ZStack{
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                
                NewAnimationView(animate: $animateLike)
            }
            
            if showHeaderAndFooter {
                HStack(alignment: .center,spacing: 20, content: {
                    
                    Button(action: {
                        if post.likedByUser {
                           unlikePost()
                        }else{
                            likePost()
                        }
                        //animateLike.toggle()
                    }, label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart" )
                            .font(.title3)
                    })
                    .accentColor(post.likedByUser ? .red : .primary)
                    
                    
                    NavigationLink(destination: CommentsView(), label:{ Image(systemName: "bubble.middle.bottom")
                            .font(.title3)
                            .foregroundColor(.primary)
                        
                    })
                        
                     Button(action: {
                         sharedPost()
                     }, label: {
                         Image(systemName: "paperplane")
                             .font(.title3)
                     })
                     .accentColor(.primary)
                    
                    Spacer()
                })
                .padding(.all, 6)
                
                if post.caption != nil {
                    HStack {
                        Text("caption for the photo")
                        Spacer(minLength: 0)
                    }
                    .padding(.all, 6)
                }
            }

            
        })
            
    }
    //MARK: funciones
    
    
    func likePost(){
        //update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username,caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount+1, likedByUser: true)
        self.post = updatedPost
        //animateLike = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            //animateLike = true
            //}
        }
    }
    
    func unlikePost(){
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username,caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount-1, likedByUser: false)
        self.post = updatedPost
    }
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType{
        case .general:
            return ActionSheet(title: Text("What would you like to do"), message: nil, buttons: [
                .destructive(Text("Report"), action: {
                    self.actionSheetType = .reporting
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        self.showActionsheet.toggle()
                    }
                }),
                .default(Text("Learn more..."), action: {
                    print("learn more pressed")
                }),
                .cancel()
            ])
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
                .destructive(Text("This is inappropriate"), action: {
                    reportPost(reason: "this is inappropiate")
                }),
                .destructive(Text("This is spam"), action: {
                    reportPost(reason: "this is spam")
                }),
                .destructive(Text("This made me uncomfortable"), action: {
                    reportPost(reason: "this made me uncomfortable")
                }),
                .cancel({
                    self.actionSheetType = .general
                })])
        }
        
        
        
    }
                func reportPost(reason: String){
                    print("report post now")
                }
    func sharedPost(){
        let message = "check our this post on doggram"
        let image = postImage
        let link = URL(string: "https://google.com")!
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "que boludo", caption: "this is a caption", dateCreate: Date(), likeCount: 0, likedByUser: false)
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true)
    }
}
