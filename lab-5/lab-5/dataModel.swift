//
//  dataModel.swift
//  lab-5
//
//  Created by Jess Ryan on 2/28/22.
//

import Foundation

struct Trivia: Decodable{
    let question: String
    let answer: String
}

struct TriviaData: Decodable{
    var trivias = [Trivia]()
}
