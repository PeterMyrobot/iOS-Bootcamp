//
//  Question.swift
//  Quizzler
//
//  Created by 楊威澤 on 2018/5/30.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation


class Question {

    let questionText : String
    let answer : Bool

    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
