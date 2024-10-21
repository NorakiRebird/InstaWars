//
//  ProfileInfo.swift
//  instagramClone
//
//  Created by Rayann chaghla on 16/11/2024.
//

import SwiftUI

struct ProfileInfoView: View {
    @ObservedObject var viewModel: ProfilViewModel
    
    var body: some View {
        VStack {
            if viewModel.isEditingName {
                TextField("Nom", text: $viewModel.tempName)
                    .foregroundColor(.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onSubmit {
                        viewModel.updateName()
                    }
            } else {
                Text(viewModel.profil.name)
                    .font(.title2)
                    .foregroundColor(.white)
                    .onTapGesture {
                        viewModel.isEditingName = true
                    }
            }
            
            Text("biographie :")
                .foregroundColor(.white)
                .fontWeight(.light)
            
            if viewModel.isEditingBio {
                TextField("Écrivez votre bio...", text: $viewModel.bio)
                    .foregroundColor(.white)
                    .fontWeight(.ultraLight)
                    .padding()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: .red, radius: 3)
                    .onSubmit {
                        viewModel.updateBio()
                    }
            } else {
                Text(viewModel.bio.isEmpty ? "Appuyez pour ajouter une bio" : viewModel.bio)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(color: .purple, radius: 3)
                    .onTapGesture {
                        viewModel.isEditingBio = true
                    }
            }
        }
        .padding(.horizontal, 20)
    }
}

