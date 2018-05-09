//
//  TicketcoServerManager.swift
//  Ticketco
//
//  Created by Roxane Gud on 4/30/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import Foundation

enum OpenWeatherError: Error {
    case serverError(OpenWeatherErrorCode, String)
    case invalidJSON(String)
}

enum OpenWeatherErrorCode: Int {
    case success        = 200
    case internalError  = 500

    case unknown = 0
}

class OpenWeatherServerManager {
    private static let serverURL = "http://api.openweathermap.org"
    private static let apiVersion = "data/2.5"
    
    private let appID = "c6e381d8c7ff98f0fee43775817cf6ad"
    
    private var baseURL: String {
        return "\(OpenWeatherServerManager.serverURL)/\(OpenWeatherServerManager.apiVersion)"
    }

    
    static let shared = OpenWeatherServerManager()



    func sendRequest(endpoint: String,
                     method: String = "GET",
                     parameters: [String: Any] = [String: Any]()) {
        guard let url = url(with: endpoint, parameters: parameters) else {
            return
        }

        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        _ = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            print("response data:", response, data)
        }.resume()
    }
    
    private func url(with endpoint: String, parameters: [String: Any]) -> URL? {
        let urlString = baseURL + endpoint
        let fullParameters = parameters.dictionary(byAppending: ["appid": appID])
        
        if var components = URLComponents(string: urlString) {
            components.queryItems = fullParameters.map { key, value -> URLQueryItem in
                return URLQueryItem(name: key, value: value as? String)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            return components.url
        }

        return nil
    }

    private static func validateResponse(_ response: HTTPURLResponse) -> OpenWeatherError? {
        let statusCode = OpenWeatherErrorCode(rawValue: response.statusCode) ?? .unknown

        switch statusCode {
        case .success:
            return nil
        case .internalError:
            return .serverError(statusCode, response.description)
        case .unknown:
            fatalError("Unrecognized code was sent from server: \n \(response.description)")
        }
    }
    
}
