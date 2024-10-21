//
//  ProfilRayann.swift
//  instagramClone
//
//  Created by Rayann chaghla on 16/11/2024.
//

import Foundation


import Foundation

struct ProfilRayann: Identifiable {
    var id = UUID()
    var name: String
    var photoName: String
    var bio: String
    var lieux: String
    var follow: Int = 0
    var isFollow: Bool = false
}


let Rayann = ProfilRayann(name: "Rayann", photoName: "Rayann", bio: "", lieux: "terre")
