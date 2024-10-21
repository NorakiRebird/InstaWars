//
//  AuthorStoryView.swift
//  instagramClone
//
//  Created by Rayann chaghla on 22/10/2024.
//

import SwiftUI

struct AuthorStoryView: View {
    let author: Author
    var width: CGFloat = 70
    var showText = true
    
    var body: some View {
        VStack {
            Image(author.photoName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 100)
                .overlay(
                    Circle()
                        .stroke(
                            Color.blue,
                            style: StrokeStyle(lineWidth: 2)
                                
                        )
                        .frame(width: 65, height: 65)
                        .blur(radius: 1)
                )
            
            if showText {
                Text(author.name)
                    .font(.subheadline)
                    .padding(.horizontal)
            }
        } .padding(.horizontal, -15)
            
    }
}


#Preview {
    ContentView()
}
