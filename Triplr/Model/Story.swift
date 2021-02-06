//
//  Story.swift
//  Triplr
//
//  Created by Marasy Phi on 1/2/21.
//

import Foundation

struct Story: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    let user: User
    let detail: String?
    
    static let dummies: [Story] = {
        User.dummies.map {
            Story(user: $0, detail: nil)
        }
    }()
    
}
