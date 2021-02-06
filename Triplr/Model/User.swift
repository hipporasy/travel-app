//
//  User.swift
//  Triplr
//
//  Created by Marasy Phi on 1/2/21.
//

import Foundation

struct User {
    let name: String
    let image: String
    let address: String
    static let dummies: [User] = [
        .init(name: "Suzy", image: "suzy", address: "Seoul"),
        .init(name: "Juri", image: "juri", address: "Seoul"),
        .init(name: "Rose", image: "rose", address: "Seoul"),
        .init(name: "IU", image: "iu", address: "Seoul"),
        .init(name: "Lany", image: "lany", address: "California"),
        .init(name: "Soy Pablo", image: "boy-pablo", address: "Spain"),
        .init(name: "Keshi", image: "keshi", address: "Texas"),
    ]
    
}


