//
//  AddPostView.swift
//  instagramClone
//
//  Created by Rayann chaghla on 09/11/2024.
//

import SwiftUI

struct AddPostView: View {
    @ObservedObject var viewModel: ListDesPostViewModel
    @State private var newPostDescription = ""
    @State private var newPostContent = ""
    @Environment(\.presentationMode) var presentationMode // Permet de fermer la vue
    
    var body: some View {
        ZStack {
            Color
                .black
                .ignoresSafeArea()
            
            VStack {
              
                Image("Bobba-Fett")
                
                    .resizable()
                    .scaledToFit()
                    
                    
                Spacer()

                    
                    
                    TextField("Description du post", text: $newPostDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.headline)
                        .bold()
                        .padding()
                    
                    TextField("Contenu", text: $newPostContent)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.headline)
                        .bold()
                        .padding()
                    
                    Button(action: {
                        
                        
                        let author = Author.all[0]
                        viewModel.addPost(author: author, imageName: "", descriptionPost: newPostDescription, posting: "", content: newPostContent)
                        
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Ajouter")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.vertical,150)
               
            }
            .background(Color(UIColor.black))
            .padding()
            .shadow(color: .red, radius: 1)
            
            
        }
    }
}

#Preview {
    let exampleViewModel = ListDesPostViewModel()
    return AddPostView(viewModel: exampleViewModel)
}
