//
//  Trip.swift
//  Triplr
//
//  Created by Marasy Phi on 4/2/21.
//

import Foundation

struct Trip: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    let title: String
    let description: String
    let images: [String]
    let user: User
    let heartCount: Int
    let commentCount: Int
    
    enum `Type`: String {
        case playing
        case exploring
        case eating
    }
        
    static var dummies = [
        Trip(title: "A Date with Bae Suzy", description: "Date Suzy eat Sushi...!", images: ["suzy.date", "suzy.date.2", "suzy.date.3", "", "", ""], user: User.dummies.first!, heartCount: 69, commentCount: 96),
        Trip(title: "Summer Date", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: ["collage.1"], user: User.dummies.last!, heartCount: 69, commentCount: 96),
        Trip(title: "Winter Break", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: [], user: User.dummies[1], heartCount: 69, commentCount: 96),
        Trip(title: "Summer Vacation", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: ["collage.1", "collage.2", "collage.3"], user: User.dummies[2], heartCount: 69, commentCount: 96),
        Trip(title: "Winter Vacation", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: ["celebrity"], user: User.dummies[3], heartCount: 69, commentCount: 96),
        Trip(title: "Summer Vacation", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: ["collage.1", "collage.2", "collage.3"], user:  User.dummies[4], heartCount: 69, commentCount: 96),
        Trip(title: "Summer Vacation", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: ["collage.1", "collage.2", "collage.3"], user: User.dummies[5], heartCount: 69, commentCount: 96),
        Trip(title: "Summer Vacation", description: "At vero eos censes tantas res gessisse sine metu contineret, saluti prospexit civium. Omne animal, simul atque integre .....", images: ["collage.1", "collage.2", "collage.3"], user: User.dummies[6], heartCount: 69, commentCount: 96),
        
    ]
    
}
