//
//  Partage.swift
//  instagramClone
//
//  Created by Rayann chaghla on 04/11/2024.
//

import SwiftUI

struct Partage: View {
    
    @StateObject private var viewModel = ListDesPostViewModel()
    @State private var estPartager = false
    @State private var selectedAuthor: Author?
    
    let columns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.authors) { author in
                        HStack {
                            Image(author.photoName)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .padding()
                                .frame(width: 90, height: 90)
                            
                            Divider()
                            
                            Text(author.name)
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button {
                                selectedAuthor = author
                                estPartager = true
                            } label: {
                                Text("Partager")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(50)
                                    .shadow(color: .red, radius: 3)
                            }
                        }
                        .padding(.horizontal)
                        Divider()
                            .frame(height: 1 )
                            .background(Color.red)
                            
                            
                       
                            
                    }
                    
                    
                }
            }
            
        }
        // mettre l'alert derrière la ZStack
        .alert(isPresented: $estPartager) {
            Alert(
                title: Text("Partage"),
                message: Text("Vous avez partagé  ce post avec \(selectedAuthor?.name ?? "un utilisateur")"),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("Partager")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    Partage()
}
