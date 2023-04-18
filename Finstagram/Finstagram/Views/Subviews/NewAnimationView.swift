//
//  NewAnimationView.swift
//  Finstagram
//
//  Created by Hector Pedro Toledo on 18/4/23.
//

import SwiftUI

struct NewAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        ZStack{
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red.opacity(0.3))
                .font(.system(size: 200))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.3)
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red.opacity(0.6))
                .font(.system(size: 150))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.4)
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red.opacity(0.9))
                .font(.system(size: 100))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.5)
        }
        //.animation(.easeOut(duration: 1.0), value: UUID())
        //.onAppear(perform: {animate.toggle()})
    }
}

struct NewAnimationView_Previews: PreviewProvider {
    
    @State static var animate: Bool = true
    
    static var previews: some View {
        NewAnimationView(animate: $animate)
    }
}
