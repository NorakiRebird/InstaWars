//
//  Author.swift
//  instagramClone
//
//  Created by Rayann chaghla on 21/10/2024.
//

import Foundation

struct Author: Identifiable {
    var id = UUID()
    let name: String
    let photoName: String
    let lieux: String
    var follow: Int = 0
    var isFollow: Bool = false
    
    static var all: [Author] = [
        Author(name: "Obi-Wan", photoName: "Obi-Wan", lieux: "Stewjon", follow: 0, isFollow: false),
        Author(name: "Luke-Skywalker", photoName: "Luke-Skywalker", lieux: "Polis Massa", follow: 0, isFollow: false),
        Author(name: "Han-Solo", photoName: "Han-Solo", lieux: "Corellia", follow: 0, isFollow: false),
        Author(name: "Leia-Organa", photoName: "Leia-Organa", lieux: "Polis Massa", follow: 0, isFollow: false),
        Author(name: "Yoda", photoName: "Yoda", lieux: "unknown", follow: 0, isFollow: false),
        Author(name: "Bobba-Fett", photoName: "Bobba-Fett", lieux: "Kamino", follow: 0, isFollow: false),
        Author(name: "Mandolarian", photoName: "Mandolarian", lieux: "Aq Vetina", follow: 0, isFollow: false),
        Author(name: "Rey", photoName: "Rey", lieux: "Hyperespace", follow: 0, isFollow: false),
       
    ]
}
