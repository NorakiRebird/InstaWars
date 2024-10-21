//
//  TheTabViews.swift
//  instagramClone
//
//  Created by Rayann chaghla on 23/10/2024.
//

import SwiftUI

struct TheTabViews: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "house.fill")
                
               
            }
            Friends()
                .tabItem {
                    Image(systemName: "person.3")
                        .font(.title2)
                }
            
            Text("add")
                .tabItem {
                    Image(systemName: "plus.app")
                        .font(.title2)
                }
            
          
            
          
            
            profileRayann(Rayann: ProfilRayann(name: "Rayann", photoName: "Rayann", bio: "", lieux: "Terre"))
                .tabItem {
                    Image(systemName: "person")
                    
                    
                }
            



            
            

             
        }
        
        .backgroundStyle(.red)
    }
}

#Preview {
    TheTabViews()
}
