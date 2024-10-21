//
//  profil.swift
//  instagramClone
//
//  Created by Rayann chaghla on 23/10/2024.
//

import SwiftUI

struct profil: View {
    
    var Choice = [ "Suivi(e)s", "Favoris"]
    @State private var selectedChoice = ""
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    HStack {
                        Image("Bobba-Fett")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170)
                            .clipShape(Circle())
                        
                        VStack {
                            Text("400")
                                .font(.subheadline)
                            Text("Publication")
                                .font(.system(size: 14))
                        }
                        Spacer()
                        
                        VStack {
                            Text("400")
                                .font(.subheadline)
                            Text("followers")
                                .font(.system(size: 14))
                            
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("400")
                                .font(.subheadline)
                            Text("Suivi(e)s")
                                .font(.system(size: 14))
                        }
                        
                        Spacer()
                        
                        
                        
                        
                    }
                    .padding(.horizontal, -8)
                    
                } // Fin de ma Vstack
                
             }
            // Fin de ma ScrollView
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Picker("Pour vous", selection: $selectedChoice) {
                        ForEach(Choice, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    
                   
                      
                    
                  
                       
                        
                         
                 // Fin de ma tab bar Item
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action du bouton
                    }) {
                        Image(systemName: "plus.app")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action du bouton
                    }) {
                        Image(systemName: "text.justify")
                    }
                    
                }
                
                
               
            }
            // Fin de ma toolbar
        }
    }
}

#Preview {
    profil()
}
