//
//  Partage.swift
//  instagramClone
//
//  Created by Rayann chaghla on 04/11/2024.
//

import SwiftUI

struct Partage: View {
    
    
    let columms = [
        GridItem(.adaptive(minimum: 90))
    ]
    @State private var unfollow = false
    
    
    var body: some View {
        ForEach(Author.all) { author in
                    
            HStack {
                     
                Image(author.photoName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                   
                    .frame(width: 90, height: 40)
                          
                Divider()
                        
                Text(author.name)
                    .font(.title3)
                
                Spacer()
                
              
                Button {
                    unfollow.toggle()
                } label: {
                    Text("Follow")
                        .background(unfollow ?  Color.red : Color.blue)
                        .font(.subheadline)
                        
                }
                
                 
              


                       
                      
            }
            
        }
              
        .padding(.horizontal)
        .navigationTitle("Partageer")
        .navigationBarTitleDisplayMode(.inline)
    }
}
           
#Preview {
    Partage()
}
