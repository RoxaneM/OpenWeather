//
//  Dictionary+Extension.swift
//  Ticketco
//
//  Created by Roxane Gud on 4/30/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

extension Dictionary {
    func dictionary(byAppending other: Dictionary) -> Dictionary {
        var resultDictionary = self
        for (key, value) in other {
            resultDictionary[key] = value
        }

        return resultDictionary
    }
}
