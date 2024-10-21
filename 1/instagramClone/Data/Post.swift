//
//  Post.swift
//  instagramClone
//
//  Created by Rayann chaghla on 21/10/2024.
//

import Foundation

struct CommentairedePost: Identifiable {
    var id  = UUID()
}







struct Post: Identifiable {
    var id = UUID()
    let author: Author
    let imageName: String
    let descriptionPost: String
    let creationDate: Date
    var likes: Int = 0
    var isBookmarked = false
    var isLiked = false
    var descriptionData: [String] = []
    
 
    static var all = [
        Post(author: Author.all[1], imageName: "p1", descriptionPost: "Quel magnifique planète !", creationDate: Date(),isLiked: false),
        
        Post(author: Author.all[2], imageName: "p2", descriptionPost: "Quel magnifique planète !", creationDate: Date().addingTimeInterval(-6000),isLiked: false),
        
        Post(author: Author.all[3], imageName: "p3", descriptionPost: "Quele magnifique planète !", creationDate: Date().addingTimeInterval(-12000),isLiked: false),
        
        Post(author: Author.all[4], imageName: "p4", descriptionPost: "Quel enfer cette planète .. !", creationDate: Date().addingTimeInterval(-32000),isLiked: false),
        
        Post(author: Author.all[5], imageName: "p5", descriptionPost: "Quel magnifique planète !", creationDate: Date().addingTimeInterval(-52000),isLiked: false),
        
        Post(author: Author.all[6], imageName: "p6", descriptionPost: "Qu'elle magnifique planête !", creationDate: Date().addingTimeInterval(-76000),isLiked: false)
        
        
       
       
       
    ]
}



 

