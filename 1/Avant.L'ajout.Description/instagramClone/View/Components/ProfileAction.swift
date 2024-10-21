//
//  ProfileAction.swift
//  instagramClone
//
//  Created by Rayann chaghla on 16/11/2024.
//

import SwiftUI

struct ProfileActionsView: View {
    @ObservedObject var viewModel: ProfilViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.isEditingName = true
                viewModel.isEditingBio = true
            } label: {
                Text("Modifier le profil")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .shadow(color: .red, radius: 5)
            }
            
            Button {
                // Action de partage
            } label: {
                Text("Partager le profil")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .shadow(color: .red, radius: 5)
                    .padding(.vertical, 5)
            }
            .padding(.vertical, 5)
        }
        .padding()
    }
}
