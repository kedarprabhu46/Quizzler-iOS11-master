//
//  Questions.swift
//  Quizzler
//
//  Created by Apple on 27/12/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
}
