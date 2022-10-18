//
//  Weather.swift
//  WeatherApp
//
//  Created by Илья on 18.10.2022.
//

import Foundation

//MARK: - CurrentWeatherData
struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//    }
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
}
