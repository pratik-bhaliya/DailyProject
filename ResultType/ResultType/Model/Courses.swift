//
//  Courses.swift
//  ResultType
//
//  Created by Pratik Bhaliya on 4/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation

struct Courses:Decodable {
    let id: Int
    let name: String
    let imageUrl: String
    let number_of_lessons: Int
}
