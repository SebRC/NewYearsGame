//
//  Question.swift
//  New Years Game
//
//  Created by Sebastian Christiansen on 31/12/2021.
//

import Foundation

public class Question {
    var description: String
    var sips: Int
    var answer: String
    
    init(description: String, sips: Int, answer: String) {
        self.description = description
        self.sips = sips
        self.answer = answer
    }
}
