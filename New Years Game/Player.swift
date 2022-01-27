//
//  Player.swift
//  New Years Game
//
//  Created by Sebastian Christiansen on 27/01/2022.
//

import Foundation

public class Player {
    var name: String
    var emoji: String
    var points: Int
    
    public init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
        self.points = 0
    }
}
