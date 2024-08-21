//
//  APIEndPoint.swift
//  Weatherly
//
//  Created by Sarvesh Doshi on 20/08/24.
//

import Foundation
enum APIEndPoint {
    
    static let baseURL = "https://api.openweathermap.org/"
    
    case coordinatesByLocationName(String)
    case weatherByLatLong(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocationName(let city):
            return "geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherApiKey)"
        case .weatherByLatLong(let lat, let long):
            return "data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(Constants.Keys.weatherApiKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndPoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
}
