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
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
            
            Text("add")
                .tabItem {
                    Image(systemName: "plus.app")
                        .font(.title2)
                }
            
          
            
            profil()
              .tabItem({
                Image(systemName: "person")
            })
        }
    }
}

#Preview {
    TheTabViews()
}
