//
//  PersonnageProfile.swift
//  instagramClone
//
//  Created by Rayann chaghla on 15/11/2024.
//

import SwiftUI
struct PersonnageProfil: View {
    var author: Author
    @State var showCommentaire = false
    @State var showPartage = false
    @State private var showAddPostSheet = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
            VStack {
                    HStack {
                        
                        VStack {
                            Image(author.photoName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .clipShape(Circle())
                            
                            Text(author.name)
                              
                                .font(.subheadline)
                               
                        }
                        .foregroundColor(.white)
                        
                        
                        
                        
                        Text("Publications: \(author.follow)")
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                    }
                    Spacer()
                    
                        .navigationTitle("Profil ")
                        
                        .navigationBarTitleDisplayMode(.inline)
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "cart")
                                .foregroundColor(.red)
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            showAddPostSheet = true
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.red)
                        }
                        
                        
                    }
                }
            }
            
            Spacer()
            }
      
        }
    }

#Preview {
    PersonnageProfil(author: Author(name: "Mandolarian", photoName: "Mandolarian", lieux: "Aq Vetina", follow: 400, isFollow: false))
}


