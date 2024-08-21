//
//  Location.swift
//  Weatherly
//
//  Created by Sarvesh Doshi on 20/08/24.
//

import Foundation

struct Location: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String
}
