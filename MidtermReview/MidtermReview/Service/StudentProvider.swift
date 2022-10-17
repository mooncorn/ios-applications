//
//  StudentProvider.swift
//  MidtermReview
//
//  Created by english on 2022-10-17.
//

import Foundation

class StudentProvider {
    static var all : [Student] = []
    
    static func save(student : Student) {
        if student.id == 0 {
            // save new student
            student.id = Student.getNextId()
            StudentProvider.all.append(student)
        } else {
            // update existing student
            for i in (0..<all.count) {
                if (all[i].id == student.id) {
                    all[i] = student
                    break
                }
            }
        }
    }
    
    static func delete(student : Student) {
        for i in (0..<all.count) {
            if  all[i].id == student.id {
                all.remove(at: i)
                break
            }
        }
    }
}

class StudentProviderTest {
    static func exec() {
        let s1 = Student(name: "Dave", email: "dave@gmail.com")
        let s2 = Student(name: "Frank", email: "frank@gmail.com")
        
        // testing adding
        StudentProvider.save(student: s1)
        StudentProvider.save(student: s2)
        
        // testing updating
        s2.email = "midu@gmail.com"
        StudentProvider.save(student: s2)
        
        // testing deleting
        StudentProvider.delete(student: s1)
        
        for student in StudentProvider.all {
            print("Id: \(student.id), email: \(student.email), name: \(student.name)")
        }
    }
}
