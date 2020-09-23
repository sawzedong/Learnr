//
//  Subject.swift
//  Learnr
//
//  Created by Shaw Sheng Saw on 20/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import Foundation
import UIKit

// note: please add other information if needed
enum completionStatus {
    case overdue, incomplete, complete
}

class Subject {
    var name: String
    var assignments: [Assignment]
    var color: UIColor
    
    // initialised with assignments
    init(name: String, assignments: [Assignment]) {
        self.name = name
        self.assignments = assignments
        self.color = UIColor(hue: CGFloat.random(in: 0...1), saturation: 0.3, brightness: 0.97, alpha: 1)
    }
    
    // initialised without assignments, default to no assignments
    init(name: String) {
        self.name = name
        self.assignments = []
        self.color = UIColor(hue: CGFloat.random(in: 0...1), saturation: 0.3, brightness: 0.97, alpha: 1)
    }
    
    static func retrievePlaceholderData() -> [Subject] {
           let items: [Subject] = [
               Subject(name: "Physics", assignments: [
                   Assignment(name: "Homework 1", completion: 0.5, timeIntervalSince1970: 1601654340),
                   Assignment(name: "Homework 2", completion: 0.7, timeIntervalSince1970: 1601740740),
                   Assignment(name: "Homework 3", completion: 0.3, timeIntervalSince1970: 1601913540),
                   Assignment(name: "Homework 4", completion: 1, timeIntervalSince1970: 1601740740),
                   Assignment(name: "Homework 5", completion: 1, timeIntervalSince1970: 1602172740),
                   Assignment(name: "Homework 6", completion: 0.8, timeIntervalSince1970: 1600790340),
               ]),
               Subject(name: "2", assignments: []),
               Subject(name: "3", assignments: []),
               Subject(name: "4", assignments: []),
               Subject(name: "5", assignments: [])
           ]
           
           return items
       }
}

class Assignment {
    var name: String
    var completion: Double
    var dueDate: Date
    var completeStatus: completionStatus
    
    // initialised with unix epoch time
    init(name: String, completion: Double, timeIntervalSince1970: Double) {
        self.name = name
        self.completion = completion
        self.dueDate = Date(timeIntervalSince1970: timeIntervalSince1970)
        self.completeStatus = .incomplete
    }
    
    init(name: String, completion: Double, timeIntervalSince1970: Double, completeStatus: completionStatus) {
        self.name = name
        self.completion = completion
        self.dueDate = Date(timeIntervalSince1970: timeIntervalSince1970)
        self.completeStatus = completeStatus
    }
    
    // initialised with an NSDate object
    init(name: String, completion: Double, dueDate: Date, completeStatus: completionStatus) {
        self.name = name
        self.completion = completion
        self.dueDate = dueDate
        self.completeStatus = completeStatus
    }
    
    // initialised with unix epoch time (default 0 completion)
    init(name: String, timeIntervalSince1970: Double, completeStatus: completionStatus) {
        self.name = name
        self.completion = 0
        self.dueDate = Date(timeIntervalSince1970: timeIntervalSince1970)
        self.completeStatus = .incomplete
    }
    
    // initialised with an NSDate object (default 0 completion)
    init(name: String, dueDate: Date, completeStatus: completionStatus) {
        self.name = name
        self.completion = 0
        self.dueDate = dueDate
        self.completeStatus = .incomplete
    }
    
    func getStringDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy, HH:mm"
        
        let myString = formatter.string(from: self.dueDate)

        return myString
    }
    
    func updateCompletion() {
        if self.dueDate > Date() && self.completeStatus != .complete {
            self.completeStatus = .incomplete
        } else if self.dueDate < Date() && self.completeStatus != .complete {
            self.completeStatus = .overdue
        }
        
        if self.completion == 1 {
            self.completeStatus = .complete
        }
    }
    
   
    
}
