//
//  Homeview.swift
//  instagramClone
//
//  Created by Rayann chaghla on 22/10/2024.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ListDesPostViewModel()
    @State var showCommentaire = false
    @State var showPartage = false
    @State private var showAddPostSheet = false
    
    var relativeFormatter: RelativeDateTimeFormatter {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(Author.all) { author in
                                AuthorStoryView(author: author)
                            }
                        }
                        .padding(.all, 10)
                        .padding(.horizontal, -10)
                    }
                    
                    Divider()
                    
                    
                    ForEach(viewModel.posts.reversed()) { post in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                AuthorStoryView(author: post.author,  showText: false)
                                
                                VStack(alignment: .leading) {
                                    NavigationLink(destination: PersonnageProfil(author: post.author)) {
                                        Text(post.author.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                    Text(post.author.lieux)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .padding()
                                    .foregroundColor(.gray)
                            }
                            .padding(.all, 10)
                            
                            Divider().background(Color.white.opacity(0.6))
                            
                            Image(post.imageName)
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .red, radius: 10)
                            
                            HStack(spacing: 20) {
                                Button(action: {
                                    if post.isLiked {
                                        viewModel.dislikePost(postID: post.id)
                                    } else {
                                        viewModel.likePost(postID: post.id)
                                    }
                                }) {
                                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                                        .font(.title)
                                        .foregroundColor(post.isLiked ? Color.blue : Color.gray.opacity(0.7))
                                }
                                .sheet(isPresented: $showAddPostSheet) {
                                    AddPostView(viewModel: viewModel)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal, 20)
                                
                                Button(action: {
                                    showCommentaire = true
                                }) {
                                    Image(systemName: "bubble.right")
                                        .font(.title)
                                        .foregroundColor(.gray.opacity(0.7))
                                }
                                .sheet(isPresented: $showCommentaire) {
                                    Commentaire()
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal, -25)
                                
                                Button(action: {
                                    showPartage = true
                                }) {
                                    Image(systemName: "paperplane")
                                        .font(.title)
                                        .foregroundColor(.gray.opacity(0.7))
                                }
                                .sheet(isPresented: $showPartage) {
                                    Partage()
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Spacer()
                                
                                Button(action: {}) {
                                    Image(systemName: "bookmark")
                                        .font(.title)
                                        .foregroundColor(.gray.opacity(0.7))
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.all, 10)
                                .padding(.horizontal, 30)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text(post.author.name)
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                
                                Text(post.descriptionPost)
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                                    .bold()
                            }
                            Button(action: {}) {
                                Text("Voir les j'aime")
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .foregroundColor(.gray)
                            }
                            .buttonStyle(PlainButtonStyle())
                            Text(relativeFormatter.localizedString(for: post.creationDate, relativeTo: Date()))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.all, 10)
                    .padding(.horizontal, -25)
                }
            }
            .navigationTitle("Insta-wars")
            .foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "camera")
                            .foregroundColor(.red)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showAddPostSheet = true
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.red)
                    }
                    
                }
            }
            
            .background(Color.black.ignoresSafeArea())
        }
        // Fin de la NavigationView
    }
}

#Preview {
    HomeView()
}
