//
//  UIFont+Ticketco.swift
//  Ticketco
//
//  Created by Roxane Gud on 5/2/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import UIKit

extension UIFont {
    private struct Helvetica {
        static let normal = "Helvetica"
        static let light = "Helvetica-Light"
        static let bold   = "Helvetica-Bold"
    }

    struct Home {
        static let CityCellFont = UIFont(name: Helvetica.bold, size: 18.0)
        static let NoDataMessageFont = UIFont(name: Helvetica.normal, size: 16.0)
    }
}
