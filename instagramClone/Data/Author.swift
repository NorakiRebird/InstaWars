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

    
    static var all: [Author] = [
        Author(name: "Obi-Wan", photoName: "Obi-Wan", lieux: "Stewjon"),
        Author(name: "Luke-Skywalker", photoName: "Luke-Skywalker", lieux: "Polis Massa"),
        Author(name: "Han-Solo", photoName: "Han-Solo", lieux: "Corellia"),
        Author(name: "Leia-Organa", photoName: "Leia-Organa", lieux: "Polis Massa"),
        Author(name: "Yoda", photoName: "Yoda", lieux: "unknown"),
        Author(name: "Bobba-Fett", photoName: "Bobba-Fett", lieux: "Kamino"),
        Author(name: "Mandolarian", photoName: "Mandolarian", lieux: "Aq Vetina"),
        Author(name: "Rey", photoName: "Rey", lieux: "Hyperespace")
       
    ]
}
