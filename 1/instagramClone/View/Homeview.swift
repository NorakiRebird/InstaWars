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
    @State private var newDescriptions: [UUID: String] = [:] // Un dictionnaire pour stocker les nouvelles descriptions par post
    
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
                    // Section Stories horizontale
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
                    
                    // Affichage des posts
                    ForEach(viewModel.posts, id: \.id) { post in
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                AuthorStoryView(author: post.author, width: 40, showText: false)
                                
                                VStack(alignment: .leading) {
                                    Text(post.author.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(post.author.lieux)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .padding()
                                    .padding(.horizontal, 20)
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
                                }, label: {
                                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                                        .font(.title)
                                        .foregroundColor(post.isLiked ? Color.blue : Color.gray.opacity(0.7))
                                })
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal, 20)
                                
                                Button(action: {
                                    showCommentaire = true
                                }, label: {
                                    Image(systemName: "bubble.right")
                                        .font(.title)
                                        .foregroundColor(.gray.opacity(0.7))
                                })
                                .sheet(isPresented: $showCommentaire, content: {
                                    Commentaire()
                                })
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal, -25)
                                
                                Button(action: {
                                    showPartage = true
                                }, label: {
                                    Image(systemName: "paperplane")
                                        .font(.title)
                                        .foregroundColor(.gray.opacity(0.7))
                                })
                                .sheet(isPresented: $showPartage, content: {
                                    Partage()
                                })
                                .buttonStyle(PlainButtonStyle())
                                
                                Spacer()
                                
                                Button(action: {}, label: {
                                    Image(systemName: "bookmark")
                                        .font(.title)
                                        .foregroundColor(.gray.opacity(0.7))
                                })
                                .buttonStyle(PlainButtonStyle())
                                .padding(.all, 10)
                                .padding(.horizontal, 30)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            // Champ de texte pour saisir une nouvelle description spécifique au post
                            TextField("Ajouter une description", text: Binding(
                                get: { newDescriptions[post.id] ?? "" },
                                set: { newDescriptions[post.id] = $0 }
                            ))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            
                            // Bouton pour ajouter la nouvelle description
                            Button(action: {
                                if let newDescription = newDescriptions[post.id], !newDescription.isEmpty {
                                    viewModel.addDescription(postID: post.id, description: newDescription)
                                    newDescriptions[post.id] = "" // Réinitialise le champ de texte
                                }
                            }, label: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.gray)
                                    .font(.title)
                            })
                            .padding(.horizontal)
                            
                            // Affichage de toutes les descriptions ajoutées pour le post
                            ForEach(post.descriptionData, id: \.self) { description in
                                Text(description)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                            }

                            HStack(alignment: .top) {
                                Text(post.author.name)
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                
                                Text(post.description)
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
                        Image(systemName: "paperplane")
                            .foregroundColor(.red)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "camera")
                            .foregroundColor(.red)
                    }
                }
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}


#Preview {
    HomeView()
}
