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
                    Text("Home")
                }
            
            Friends()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Friends")
                }
            
            Text("add")
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Add")
                }
            
            ProfilRayannView(Rayann: ProfilRayann(name: "Rayann", photoName: "Rayann", bio: "", lieux: "Terre"))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.red) // Pour le style de fond
    }
}

#Preview {
    TheTabViews()
}
