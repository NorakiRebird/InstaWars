//
//  ViewModel.swift
//  instagramClone
//
//  Created by Rayann chaghla on 04/11/2024.
//
import Foundation

class ListDesPostViewModel: ObservableObject {
    @Published var posts: [Post] = Post.all
    
    
    func likePost(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].isLiked = true
            posts[index].likes += 1
        }
    }
    
    func dislikePost(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }), posts[index].isLiked {
            posts[index].isLiked = false
            posts[index].likes = max(0, posts[index].likes - 1)
        }
    }
    
  
    
    func addPost(author: Author, imageName: String, descriptionPost: String, posting: String, content: String) {
        let newPost = Post(author: author, imageName: imageName, descriptionPost: descriptionPost, creationDate: Date(), postingPost: posting)
        posts.append(newPost)
    }
}
