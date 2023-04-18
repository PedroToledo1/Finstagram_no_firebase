//
//  CommentModel.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 14/4/23.
//

import Foundation
import SwiftUI

struct commentModel: Identifiable, Hashable{
    var id = UUID()
    var commentID: String // id for the comment in database
    var userID: String // id for the user database
    var username: String // username for the user in the database
    var content: String // actually comment text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }
}
