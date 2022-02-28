//
//  AutoComplete.swift
//  WeatherSearch
//
//  Created by 韩云昊 on 12/6/21.
//

import Foundation
import SwiftUI
import SwiftyJSON
import CoreLocation


class GetDailyWeather: ObservableObject {
//    @Published var weathers = [DailyWeather]()
    @Published var weahters: JSON = ([])
    var geocoder = CLGeocoder()
    var lat:Double = 0.0
    var lon:Double = 0.0
    
    func getWeather(address: String) {
        
        geocoder.geocodeAddressString(address) {
            placemarks, error in
            let placemark = placemarks?.first
//            self.lat = String(describing: placemark?.location?.coordinate.latitude)
//            self.lon = String(describing:placemark?.location?.coordinate.longitude)
            self.lat = Double(placemark?.location?.coordinate.latitude ?? 0)
            self.lon = Double(placemark?.location?.coordinate.longitude ?? 0)
//            self.lat = "34.053345"
//            self.lon = "-118.242349"
            print("Lat: \(self.lat), Lon: \(self.lon)")
            let jsonUrlString = " https://hyh-hw8-backend.wm.r.appspot.com/getWeatherInfo?latitude=" + String(self.lat) + "&longitude=" + String(self.lon)
    
            print("the request string is " + jsonUrlString)
            
            guard let url = URL(string: jsonUrlString) else { fatalError("Missing URL") }

            let urlRequest = URLRequest(url: url)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }

                guard let response = response as? HTTPURLResponse else { return }

                if response.statusCode == 200 {
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        let json = try? JSON(data: data)
                        self.weahters = JSON(json)
                        print(self.weahters)
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
//                            } catch {
//                                print(error.localizedDescription)
//                            }
//    //                        for item in json["predictions"].arrayValue {
//    //                            print(item["structured_formatting"]["main_text"].stringValue)
//    //                            self.weather.append(item["structured_formatting"]["main_text"])
//    //                        }
//                        }
                    }
                }
            }
            dataTask.resume()
        }
        
        
        
        
    }
    enum NetworkError : Error {
        case invalidResponse
        case invalidData
        case error(err : String)
        case decodedError(err : String)
    }
}


struct DailyWeather: Decodable, Identifiable {
    var id = UUID()
    
    var startTime: String
    var values: Value
    
}

struct DailyWeathers: Decodable{
    let dailyWeather:[DailyWeather]
}

struct Value: Decodable{
    var temperature: Double
    var temperatureApparent:Double
    var temperatureMin: Double
    var temperatureMax: Double
    var windSpeed: Double
    var windDirection: Double
    var humidity: Double
    var pressureSeaLevel: Double
    var weatherCode: Int
    var precipitationProbability: Double
    var precipitationType: Int
    var sunriseTime: String
    var sunsetTime:String
    var visibility: Int
    var moonPhase: Int
    var cloudCover:Double
}
