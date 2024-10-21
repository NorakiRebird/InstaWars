//
//  ProfilViewModel.swift
//  instagramClone
//
//  Created by Rayann chaghla on 16/11/2024.
//

import SwiftUI

class ProfilViewModel: ObservableObject {
    @Published var profil: ProfilRayann
    @Published var tempName: String
    @Published var bio: String
    @Published var isEditingBio = false
    @Published var isEditingName = false
    @Published var showImagePicker = false
    @Published var selectedImage: UIImage?
    
    init(profil: ProfilRayann) {
        self.profil = profil
        self.tempName = profil.name
        self.bio = profil.bio
    }
    
    func updateName() {
        profil.name = tempName
        isEditingName = false
    }
    
    func updateBio() {
        profil.bio = bio
        isEditingBio = false
    }
}
