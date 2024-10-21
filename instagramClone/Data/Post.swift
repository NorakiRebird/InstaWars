//
//  Post.swift
//  instagramClone
//
//  Created by Rayann chaghla on 21/10/2024.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    let author: Author
    let imageName: String
    let comment: String
    let creationDate: Date
    var likes: Int = 0
    var isBookmarked = false
    var isLiked: Bool = false
    
    
    // Un problèmz
    
    static var all = [
        Post(author: Author.all[1], imageName: "p1", comment: "Qu'elle magnifique planête !", creationDate: Date(), isLiked: false),
        
        Post(author: Author.all[2], imageName: "p2", comment: "Qu'elle magnifique planête !", creationDate: Date().addingTimeInterval(-6000), isLiked: true),
        
        Post(author: Author.all[3], imageName: "p3", comment: "Qu'elle magnifique planête !", creationDate: Date().addingTimeInterval(-12000), isLiked: false),
        
        Post(author: Author.all[4], imageName: "p4", comment: "Qu'elle enfer cette planête .. !", creationDate: Date().addingTimeInterval(-32000), isLiked: true),
        
        Post(author: Author.all[5], imageName: "p5", comment: "Qu'elle magnifique planête !", creationDate: Date().addingTimeInterval(-52000), isLiked: false),
        
        Post(author: Author.all[6], imageName: "p6", comment: "Qu'elle magnifique planête !", creationDate: Date().addingTimeInterval(-76000), isLiked: true)
       
       
       
    ]
}





