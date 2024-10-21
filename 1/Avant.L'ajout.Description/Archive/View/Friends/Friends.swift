//
//  Friends.swift
//  instagramClone
//
//  Created by Rayann chaghla on 06/11/2024.
//

import SwiftUI

struct Friends: View {
    
    @StateObject private var viewModel = ListDesFollower()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.follows) { friends in
                            VStack {
                                HStack {
                                    Image(friends.photoName)
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 76, height: 76)
                                    
                                    Text(friends.name)
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                    Button {
                                        if friends.isFollow {
                                            viewModel.unfollow(authorID: friends.id)
                                        } else {
                                            viewModel.follow(authorID: friends.id)
                                        }
                                    } label: {
                                        Text(friends.isFollow ? "Unfollow" : "Follow")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(friends.isFollow ? Color.red : Color.blue)
                                            .cornerRadius(8)
                                        
                                    }
                                }
                                Divider()
                                    .frame(height: 1 )
                                    .background(Color.red)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        }
                    }
                }
                .navigationTitle("Your Friends")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    Friends()
}

