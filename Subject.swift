//
//  Subject.swift
//  Learnr
//
//  Created by Shaw Sheng Saw on 20/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import Foundation

// note: please add other information if needed

class Subject {
    var name: String
    var assignments: [Assignment]
    
    // initialised with assignments
    init(name: String, assignments: [Assignment]) {
        self.name = name
        self.assignments = assignments
    }
    
    // initialised without assignments, default to no assignments
    init(name: String) {
        self.name = name
        self.assignments = []
    }
    
}

class Assignment {
    var name: String
    var completion: Double
    var dueDate: Date
    
    // initialised with unix epoch time
    init(name: String, completion: Double, timeIntervalSince1970: Double) {
        self.name = name
        self.completion = completion
        self.dueDate = Date(timeIntervalSince1970: timeIntervalSince1970)
    }
    
    // initialised with an NSDate object
    init(name: String, completion: Double, dueDate: Date) {
        self.name = name
        self.completion = completion
        self.dueDate = dueDate
    }
    
    // initialised with unix epoch time (default 0 completion)
    init(name: String, timeIntervalSince1970: Double) {
        self.name = name
        self.completion = 0
        self.dueDate = Date(timeIntervalSince1970: timeIntervalSince1970)
    }
    
    // initialised with an NSDate object (default 0 completion)
    init(name: String, dueDate: Date) {
        self.name = name
        self.completion = 0
        self.dueDate = dueDate
    }
    
    func getStringDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy, HH:mm:ss"
        
        let myString = formatter.string(from: self.dueDate)

        return myString
    }
    
}
