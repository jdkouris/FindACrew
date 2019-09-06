//
//  Person.swift
//  FindACrew
//
//  Created by John Kouris on 9/5/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let name: String
    let gender: String
    let birthYear: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
    }
}

struct PersonSearch: Decodable {
    let results: [Person]
}
