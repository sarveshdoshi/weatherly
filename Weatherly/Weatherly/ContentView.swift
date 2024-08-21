//
//  ContentView.swift
//  Weatherly
//
//  Created by Sarvesh Doshi on 20/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    @State private var weather: Weather?

    let geoCodingClient = GeoCodingClient()
    let weatherClient = WeatherClient()
    
    private func fetchWeather() async {
        do {
            guard let location = try await geoCodingClient.coordinateByCity(city) else { return }
             weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather {
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp))
                    .font(.system(size: 100))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
