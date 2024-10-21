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
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.follows) { friend in
                        VStack {
                            HStack {
                                Image(friend.photoName)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 76, height: 76)
                                
                                Text(friend.name)
                                Spacer()
                                
                                Button {
                                    if friend.isFollow {
                                        viewModel.unfollow(authorID: friend.id)
                                    } else {
                                        viewModel.follow(authorID: friend.id)
                                    }
                                } label: {
                                    Text(friend.isFollow ? "Unfollow" : "Follow")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(friend.isFollow ? Color.red : Color.blue)
                                        .cornerRadius(8)
                                        
                                }
                            }
                            Divider()
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

#Preview {
    Friends()
}




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
