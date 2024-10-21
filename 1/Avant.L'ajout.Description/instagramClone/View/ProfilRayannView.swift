//
//  ProfilRayannView.swift
//  instagramClone
//
//  Created by Rayann chaghla on 16/11/2024.
//

import SwiftUI

struct ProfilRayannView: View {
    @StateObject private var viewModel: ProfilViewModel
    
    init(Rayann: ProfilRayann) {
        _viewModel = StateObject(wrappedValue: ProfilViewModel(profil: Rayann))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 25) {
                    ProfileImageView(viewModel: viewModel)
                    ProfileInfoView(viewModel: viewModel)
                    ProfileActionsView(viewModel: viewModel)
                    Spacer()
                }
                .navigationTitle("Profil")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "cart")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.selectedImage)
        }
    }
}

#Preview {
    ProfilRayannView(Rayann: ProfilRayann(name: "Rayann", photoName: "Rayann", bio: "", lieux: "Terre"))
}
