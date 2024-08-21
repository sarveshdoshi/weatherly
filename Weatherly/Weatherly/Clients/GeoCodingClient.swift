//
//  GeoCodingClient.swift
//  Weatherly
//
//  Created by Sarvesh Doshi on 21/08/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct GeoCodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location? {
        
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endpointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
    }
    
}
