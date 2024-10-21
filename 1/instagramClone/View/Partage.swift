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
    
    
    var body: some View {
        ScrollView{
          
            LazyVGrid(columns: columms, spacing: 20)  {
                
                ForEach(Author.all) { author in
                    
                    VStack {
                     
                        Image(author.photoName)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.circle)
                            .frame(width: 90, height: 40)
                          
                        
                        
                        Text(author.name)

                       
                      
                    }
                    
                        
                  

                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 500)
            .padding(.vertical, 260)
            
            
        }
        
       
    }
}
           
#Preview {
    Partage()
}
