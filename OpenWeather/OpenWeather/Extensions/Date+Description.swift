//
//  Date+Quest.swift
//  Quest-ios
//
//  Created by Roksana Markhyvka on 11/22/17.
//  Copyright © 2017 SecretCircle. All rights reserved.
//
import Foundation

extension Date {
    func weekdayDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        dateFormatter.dateStyle = .full
        
        return dateFormatter.string(from: self)
    }
    
    func mediumDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.dateStyle = .medium

        return dateFormatter.string(from: self)
    }
    
    func fullDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-hh-mm-ss"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        return dateFormatter.string(from: self)
    }
}
