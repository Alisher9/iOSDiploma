//
//  WeatherData.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/19/21.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

