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
    
    func addDescription(postID: UUID, description: String) {
        if let postIndex = posts.firstIndex(where: { $0.id == postID }) {
            posts[postIndex].descriptionData.append(description)
        }
    }
    
    func removeDescription(postID: UUID, description: String) {
        if let postIndex = posts.firstIndex(where: { $0.id == postID }) {
            posts[postIndex].descriptionData.removeAll { $0 == description }
        }
    }
}
