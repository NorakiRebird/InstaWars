//
//  ViewModel.swift
//  instagramClone
//
//  Created by Rayann chaghla on 04/11/2024.
//
import Foundation

class ListDesPostViewModel: ObservableObject {
    @Published var posts: [Post] = Post.all
    @Published var authors: [Author] = Author.all
    
    
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
    
    func deletePost(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts.remove(at: index)
        }
    }

    func Follow(authorID: UUID) {
        if let index = authors.firstIndex(where: { $0.id == authorID }) {
            authors[index].isFollow = true
            authors[index].follow += 1
        }
    }
    
    func unfollow(authorID: UUID) {
        if let index = authors.firstIndex(where: { $0.id == authorID }), authors[index].isFollow {
            authors[index].isFollow = false
            authors[index].follow = max(0, authors[index].follow - 1)
        }
    }
    
    
    
    func estPartager(authorID: UUID) {
        if let index = authors.firstIndex(where: { $0.id == authorID }) {
            authors[index].isFollow = true
            authors[index].follow += 1
        }
    }
    
    func partager(authorID: UUID) {
        if let index = authors.firstIndex(where: { $0.id == authorID }), authors[index].isFollow {
            authors[index].isFollow = false
            authors[index].follow = max(0, authors[index].follow - 1)
        }
    }
    
  
    
  
    
    func addPost(author: Author, imageName: String, descriptionPost: String, posting: String, content: String) {
        let newPost = Post(author: author, imageName: imageName, descriptionPost: descriptionPost, creationDate: Date(), postingPost: posting)
        posts.append(newPost)
    }
}
 








//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------













class ListDesFollower: ObservableObject {
    @Published var follows: [Author] = Author.all
    
    func follow(authorID: UUID) {
        if let index = follows.firstIndex(where: { $0.id == authorID }) {
            follows[index].isFollow = true
            follows[index].follow += 1
        }
    }
    
    func unfollow(authorID: UUID) {
        if let index = follows.firstIndex(where: { $0.id == authorID }), follows[index].isFollow {
            follows[index].isFollow = false
            follows[index].follow = max(0, follows[index].follow - 1)
        }
    }
}
