//
//  TrimData.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/5/21.
//

import Foundation
import SwiftyJSON
import Alamofire

struct TrimData{
    
    var favCitiesJSON: [JSON] = []
    static var cityinFavourite: [String] = []
    var curCityIndex = 0
    
    static func getJsonByCity(city: String) -> JSON{
        if let path = Bundle.main.path(forResource: city, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSON(data: data)
//                print(json)
                return json
                //                        self.weathers = []
                                        
                //                        if let json = try? JSON(data: data)
                                            
                //                        {
                ////                            print(json)
                //    //                        let dailyWeatherJson = json["data"]["timelines"]
                //                            do {
                //                                let result = try JSONDecoder().decode(DailyWeathers.self, from: data)
                //                                print("result coming")
                //                                print(result)
                //                                for item in result.dailyWeather{
                //                                    self.weathers.append(item)
                //                                }
              } catch {
                   // handle error
                  print("error with loading json")
              }
        }
        return 0
    }
    
    static func getSampleJSON() -> JSON {
        
        if let path = Bundle.main.path(forResource: "Los Angeles", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSON(data: data)
//                print(json)
                return json
                
              } catch {
                   // handle error
                  print("error with loading json")
              }
        }
        return 0
    }

    
    static func getWeatherNameFromCode(weatherCode: Int)->String{
        switch (weatherCode){
          case 4200:
            return
                "Light Rain"
          case 6201:
            return
                "Heavy Freezing Rain"
          case 6001:
            return
                "Freezing Rain"
        case 7101:
          return
              "Heavy Ice Pellets"
        case 7000:
          return
              "Ice Pellets"
          case 6200:
            return
                "Light Freezing Rain"
            
        case 4201:
          return
              "Heavy Rain"
        case 4001:
          return
              "Rain"
          case 6000:
            return
                "Freezing Drizzle"
          case 4000:
            
            return
                "Drizzle"
        case 2100:
          return
              "Light Fog"
        case 2000:
          return
              "Fog"
        case 1001:
          return "Cloudy"
          case 7102:
            return
                "Light Ice Pellets"
          case 5101:
            return
                "Heavy Snow"
          case 5000:
            return
                "Snow"
          case 5100:
            return
                "Light Snow"
          case 5001:
            return "Flurries"
          case 8000:
            return
                "Thunderstorm"
          case 1102:
            return "Mostly Cloudy"
          case 1101:
            return "Partly Cloudy"
          case 1100:
            return "Mostly Clear"
          case 1000:
            return "Clear"
          default:
            return "Cloudy"
        }
      }
    
    static func operateFavCity(cityName: String){
        if self.cityinFavourite.contains(cityName){
            let index = self.cityinFavourite.firstIndex(of: cityName)!
            cityinFavourite.remove(at: index)
        }else{
            cityinFavourite.append(cityName)
        }
    }
    
    static func check(cityName: String) -> Bool {
        if self.cityinFavourite.contains(cityName){
            return true
        }else{
            return false
        }
    }
    
    
    
    static func formatDate(standardDate: String)->String{
        let beginFormat : Bool = true
        if beginFormat{
            let dateFormat: String = "yyyy-MM-dd"
        }
        let inputFormat = DateFormatter()
        inputFormat.locale = Locale(identifier: "en_US")
        inputFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        inputFormat.timeZone = TimeZone(secondsFromGMT: 0)
        
        let date = inputFormat.date(from: standardDate)
        
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "MM/dd/yyyy"
        return outputFormat.string(from: date!)
    }
    
    static func getDate(index: Int, json:JSON) -> String {
        let standardTime = json[0]["intervals"][index]["startTime"].stringValue
        return formatDate(standardDate: standardTime)
    }
    
    
    static func getSunRise(index: Int, json: JSON)->String{
        let standardTime = json[0]["intervals"][index]["values"]["sunriseTime"].stringValue
        return formatTime(standardDate: standardTime)
    }
    
    static func getWeatherNameIterative(index: Int, json:JSON)->String{
        let weatherCode = json[0]["intervals"][index]["values"]["weatherCode"].intValue
        return getWeatherNameFromCode(weatherCode: weatherCode)
    }
    
    static func getSunSet(index: Int, json: JSON)->String{
        let standardTime = json[0]["intervals"][index]["values"]["sunsetTime"].stringValue
        return formatTime(standardDate: standardTime)
    }
    
    static func formatTime(standardDate: String)->String{
        let inputFormat = DateFormatter()
        inputFormat.locale = Locale(identifier: "en_US")
        inputFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        inputFormat.timeZone = TimeZone(secondsFromGMT: 0)
        
        let date = inputFormat.date(from: standardDate)
        
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "HH:mm"
        return outputFormat.string(from: date!)
    }
    
    static func getTodayValues(cityJSON: JSON)->[Any]{
        let values = cityJSON[0]["intervals"][0]["values"]
        if(values != nil){
            let windSpeed = values["windSpeed"].doubleValue
            let pressure = values["pressureSeaLevel"].doubleValue
            let precipitation = values["precipitationProbability"].doubleValue
            let temperature = values["temperature"].doubleValue
            let humidity = values["humidity"].doubleValue
            let weatherName = getWeatherNameFromCode(weatherCode: values["weatherCode"].intValue)
            let visibility = values["visibility"].doubleValue
            let cloudCover = values["cloudCover"].intValue
            let uvIndex = values["uvIndex"].intValue
            return [windSpeed, pressure, precipitation, temperature, weatherName, humidity, visibility, cloudCover, uvIndex]

        }
        return []
    }

}
