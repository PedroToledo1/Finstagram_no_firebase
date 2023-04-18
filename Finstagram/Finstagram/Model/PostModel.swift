//
//  PostModel.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 12/4/23.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable{
    var id = UUID()
    var postID: String // ID for posts in database
    var userID: String // ID for user in database
    var username: String
    var caption: String?
    var dateCreate: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }
}
