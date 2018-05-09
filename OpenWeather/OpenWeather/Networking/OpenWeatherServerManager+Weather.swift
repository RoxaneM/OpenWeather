//
//  OpenWeatherServerManager+Weather.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import Foundation

extension OpenWeatherServerManager {
    func getWeather(for city: String, completion: @escaping ((Weather?, OpenWeatherError?) -> Void)) {
        let parameters = [APIConstants.city: city]
        self.sendRequest(endpoint: .weather, parameters: parameters) { data, error in
            guard error == nil else {
                completion(nil, (error as? OpenWeatherError ?? .unknown))
                return
            }
            
            guard let data = data else {
                completion(nil, OpenWeatherError.invalidData)
                return
            }
            
            do {
                print("response data:", String(data: data, encoding: .utf8)!)

                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(weather, nil)
            } catch let error {
                completion(nil, (error as? OpenWeatherError ?? .unknown))
            }
        }
    }
}
