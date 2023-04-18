//
//  SettingRowView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 17/4/23.
//

import SwiftUI

struct SettingRowView: View {
    
    var leftIcon: String
    var text: String
    var color: Color
    
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: leftIcon)
            }
            .frame(width: 36,height: 36,alignment: .center)
            .foregroundColor(.white)
            
            
            
            Text(text)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(leftIcon: "heart.fill", text: "rowtitle", color: .red)
    }
}
