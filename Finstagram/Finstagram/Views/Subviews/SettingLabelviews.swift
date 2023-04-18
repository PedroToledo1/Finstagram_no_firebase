//
//  SettingLabelviews.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 16/4/23.
//

import SwiftUI

struct SettingLabelviews: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        VStack {
            HStack{
                Text(labelText)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: labelImage)
                
            }
            Divider()
                .padding(.vertical, 4)
            
            
            
        }
    }
}

struct SettingLabelviews_Previews: PreviewProvider {
    static var previews: some View {
        SettingLabelviews(labelText: "TestLabel", labelImage: "heart")
    }
}
