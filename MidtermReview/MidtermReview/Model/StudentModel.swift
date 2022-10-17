//
//  Student.swift
//  MidtermReview
//
//  Created by english on 2022-10-17.
//

import Foundation

class Student {
    
    static var lastUserId : Int = 0
    
    var id : Int
    var name : String
    var email : String
    
    init(id : Int = 0, name : String, email : String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    static func getNextId() -> Int {
        Student.lastUserId += 1
        return Student.lastUserId
    }
}
