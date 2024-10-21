//
//  ProfileImage.swift
//  instagramClone
//
//  Created by Rayann chaghla on 16/11/2024.
//

import SwiftUI

struct ProfileImageView: View {
    @ObservedObject var viewModel: ProfilViewModel
    
    var body: some View {
        ZStack {
            
            if let selectedImage = viewModel.selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            } else {
                Image(viewModel.profil.photoName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            }
            
            Button {
                viewModel.showImagePicker = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .background(Color.red.clipShape(Circle()))
                    .shadow(color: .red, radius: 12)
            }
            .offset(x: 50, y: 50)
        }
    }
}
