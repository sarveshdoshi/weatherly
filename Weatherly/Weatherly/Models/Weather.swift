//
//  Weather.swift
//  Weatherly
//
//  Created by Sarvesh Doshi on 20/08/24.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
}
