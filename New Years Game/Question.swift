//
//  Question.swift
//  New Years Game
//
//  Created by Sebastian Christiansen on 31/12/2021.
//

import Foundation

public class Question {
    var description: String
    var points: Int
    var answer: String
    
    init(description: String, points: Int, answer: String) {
        self.description = description
        self.points = points
        self.answer = answer
    }
}
