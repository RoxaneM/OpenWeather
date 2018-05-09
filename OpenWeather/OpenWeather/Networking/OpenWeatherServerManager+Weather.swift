//
//  OpenWeatherServerManager+Weather.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import Foundation

extension OpenWeatherServerManager {
    func getWeather(for city: String) {
        let parameters = [APIConstants.city: city]
        self.sendRequest(endpoint: .weather, parameters: parameters)
    }
}
