//
//  Homeview.swift
//  instagramClone
//
//  Created by Rayann chaghla on 22/10/2024.
//
import SwiftUI

struct HomeView: View {
    var relativeFormatter: RelativeDateTimeFormatter {
        let Formatter = RelativeDateTimeFormatter()
        Formatter.unitsStyle = .full
        Formatter.locale = Locale(identifier: "fr_FR")
        return Formatter
        
        
    }
    
    @State private var estActiver = false
    
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
                    ForEach(Post.all) { post in
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                AuthorStoryView(author: post.author, width: 40, showText: false)
                                
                                VStack(alignment: .leading) {
                                    Text(post.author.name)
                                        .font(.headline)
                                    Text(post.author.lieux)
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .padding()
                                    .padding(.horizontal, 20)
                            }
                            .padding(.all, 10)
                            
                            Divider()
                            Image(post.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            HStack(spacing: 20) {
                                Button(action: {
                                    Toggle("", isOn: $estActiver )
                                       
                                }, label: {
                                    Image(systemName: estActiver ? "heart.fill" : "heart")
                                        .font(.title)
                                        .foregroundColor(estActiver ? Color.red : Color.black)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal, 20)
                                
                                Button(action: {}, label: {
                                    Image(systemName: "bubble.right")
                                        .font(.title)
                                })
                                .buttonStyle(PlainButtonStyle())
                                
                                Button(action: {}, label: {
                                    Image(systemName: "paperplane")
                                        .font(.title)
                                })
                                .buttonStyle(PlainButtonStyle())
                                
                                Spacer()
                                
                                Button(action: {}, label: {
                                    Image(systemName: "bookmark")
                                        .font(.title)
                                })
                                .buttonStyle(PlainButtonStyle())
                                .padding(.all, 10)
                                .padding(.horizontal, 30)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Button(action: {}) {
                                Text("Voir les j'aime")
                                    .font(.headline)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            HStack(alignment: .top) {
                                Text(post.author.name)
                                    .font(.headline)
                                    .padding(.horizontal)
                                Text(post.comment)
                                    .lineLimit(nil)
                            }
                            
                            Text(relativeFormatter.localizedString(for: post.creationDate, relativeTo: Date()))
                        }
                        .padding(.horizontal)
                    }
                    .padding(.all, 10)
                    .padding(.horizontal, -25)
                }
            }
            // Fin de ma ScrollView
            .navigationTitle("Insta-wars")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action du bouton
                    }) {
                        Image(systemName: "paperplane")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "camera")
                    }
                }
            }
        }
        // Fin de ma NavigationView
    }
}

#Preview {
    HomeView()
}
