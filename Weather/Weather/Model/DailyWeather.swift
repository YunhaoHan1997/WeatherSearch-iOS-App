//
//  DailyWeather.swift
//  MyWeatherApp
//
//  Created by YunhaoHan on 12/1/21.
//

import Foundation

struct NewDailyWeather : Codable, Identifiable {
    
    var dt : Int
    var temp : Temperature
    var weather : [WeatherDetail]
    
    enum CodingKey {
        
        case dt
        case temp
        case weather
        
    }
    
    init() {
        
        dt = 006/05/21
        temp = Temperature(max: 0.0, min: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
    
}

extension NewDailyWeather{
    
    var id : UUID {
        return UUID()
    }
}
