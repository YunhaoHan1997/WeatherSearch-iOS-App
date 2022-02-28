//
//  WeatherResponse.swift
//  MyWeatherApp
//
//  Created by YunhaoHan on 12/5/21.
//

import Foundation

struct WeatherResponse : Codable  {

    var current : Weather
    var hourly : [Weather]
    var daily : [NewDailyWeather]
    
    static func empty() -> WeatherResponse {
        
        return WeatherResponse(current: Weather(), hourly: [Weather](repeating: Weather(), count: 23), daily: [NewDailyWeather](repeating: NewDailyWeather(), count: 8))
    }
    
}
