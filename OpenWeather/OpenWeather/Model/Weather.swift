//
//  Weather.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let temperature: Float
    let pressure: Float
    let humidity: Float
    
    var description: String {
        return "Humidity is: \(humidity), \nPressure is: \(pressure)"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ForecastCodingKeys.self)

        let main = try container.nestedContainer(keyedBy: MainCodingKeys.self,
                                                 forKey: .main)
        temperature = try main.decode(Float.self, forKey: .temparature)
        pressure = try main.decode(Float.self, forKey: .pressure)
        humidity = try main.decode(Float.self, forKey: .humidity)
    }
}

// MARK: - Coding Keys
//------------------------------------------------------------------------------
fileprivate extension Weather {
    enum ForecastCodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather
        case main
        case wind
        case clouds
    }
    
    enum CoordinatesCodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
    
    enum WeatherCodingKeys: String, CodingKey {
        case description
        case icon
    }
    
    enum MainCodingKeys: String, CodingKey {
        case temparature = "temp"
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    enum WindCodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}


