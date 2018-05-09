//
//  UIColor+Ticketco.swift
//  Ticketco
//
//  Created by Roxane Gud on 5/2/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import UIKit

extension UIColor {
    private struct OpenWeatherApp {
        static let WhiteColor = UIColor(hex: 0xFAFAFA)
        static let BlackColor = UIColor(hex: 0x000000)
        static let RedColor = UIColor(hex: 0xFC4A1A)
        static let GreenColor = UIColor(hex: 0x5FD98C)
        static let GreyColor = UIColor(hex: 0xA0A0A0)
        static let DarkGreyColor = UIColor(hex: 0x526173)
        static let LightGreyColor = UIColor(hex: 0xF0F0F0)
    }

    struct Home {
        static let CityCellTextColor = OpenWeatherApp.DarkGreyColor
        static let CityCellBackgroundColor = OpenWeatherApp.WhiteColor
    }

// MARK: - Auxiliary
    convenience init(hex: Int, opacity: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff, opacity: opacity)
    }

    convenience init(red: Int, green: Int, blue: Int, opacity: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
    }
}