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
enum completionStatus: CaseIterable {
    case overdue, incomplete, complete
}

class Subject: Codable {
    var name: String
    var assignments: [Assignment]
    var colorHue: CGFloat
    
    // initialised with assignments
    init(name: String, assignments: [Assignment]) {
        self.name = name
        self.assignments = assignments
        self.colorHue = CGFloat.random(in: 0...1)
    }
    
    // initialised without assignments, default to no assignments
    init(name: String) {
        self.name = name
        self.assignments = []
        self.colorHue = CGFloat.random(in: 0...1)

    }
    
    func getColor() -> UIColor {
        return UIColor(hue: self.colorHue, saturation: 0.3, brightness: 0.97, alpha: 1)
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
    
    
    static func getArchiveURL() -> URL {
        let plistName = "subjects"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(subjectItems: [Subject]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedData = try? propertyListEncoder.encode(subjectItems)
        try? encodedData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Subject]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedData = try? propertyListDecoder.decode(Array<Subject>.self, from: retrievedData) else { return nil }
        return decodedData
    }
    
}

class Assignment: Codable {
    var name: String
    var completion: Double
    var timeIntervalSince1970: Double
    var completeStatus: Int // see completionStatus, where index starts from 0
    
    // initialised with unix epoch time
    init(name: String, completion: Double, timeIntervalSince1970: Double) {
        self.name = name
        self.completion = completion
        self.timeIntervalSince1970 = timeIntervalSince1970
        self.completeStatus = 1
    }
    
    init(name: String, completion: Double, timeIntervalSince1970: Double, completeStatus: Int) {
        self.name = name
        self.completion = completion
        self.timeIntervalSince1970 = timeIntervalSince1970
        self.completeStatus = completeStatus
    }
    
    // initialised with unix epoch time (default 0 completion)
    init(name: String, timeIntervalSince1970: Double, completeStatus: Int) {
        self.name = name
        self.completion = 0
        self.timeIntervalSince1970 = timeIntervalSince1970
        self.completeStatus = completeStatus
    }
    
    func getStringDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy, HH:mm"
        let dueDate = Date(timeIntervalSince1970: self.timeIntervalSince1970)
        let myString = formatter.string(from: dueDate)

        return myString
    }
    
    func updateCompletion() {
        let dueDate = Date(timeIntervalSince1970: self.timeIntervalSince1970)
        if dueDate > Date() && self.completeStatus != 2 {
            self.completeStatus = 1
        } else if dueDate < Date() && self.completeStatus != 2 {
            self.completeStatus = 0
        }
        
        if self.completion == 1 {
            self.completeStatus = 2
        }
    }
    
    func getCompletionStatus() -> completionStatus {
        return completionStatus.allCases[self.completeStatus]
    }
    
   
    
}
