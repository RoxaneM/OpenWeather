//
//  OpenWeatherConstants.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/10/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import Foundation
struct APIConstants {
    static let contentType = "Content-Type"
    static let applicationJson = "application/json"
    static let appID = "appid"
    
    //parameters
    static let city = "q"
    
    //endpoints
    enum Endpoint: String {
        case weather = "/weather"
        case forecast = "/forecast"
    }
    
}
struct DisplayMessages {
    static let noCitiesMessage = "OOPS!\n No bookmarked cities yet. Click '+' button to add city"
}
