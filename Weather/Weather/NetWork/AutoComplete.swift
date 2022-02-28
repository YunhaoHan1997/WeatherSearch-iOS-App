//
//  AutoComplete.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/7/21.
//

import Foundation
import SwiftyJSON

class AutoComplete: ObservableObject {
    @Published var cities = [String]()

    func getcities(keyword: String) {
        let jsonUrlString = "https://hyh-hw8-backend.wm.r.appspot.com/autocomplete?keyword=\(keyword)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        var urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: jsonUrlString!) else { fatalError("Missing URL") }

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
                    do {
                        self.cities = []
                        if let json = try? JSON(data: data) {
                            for item in json["predictions"].arrayValue {
                                print(item["structured_formatting"]["main_text"].stringValue)
                                self.cities.append(item["structured_formatting"]["main_text"].stringValue)
                            }
                        }
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    enum NetworkError : Error {
        
        case invalidResponse
        case invalidData
        case error(err : String)
        case decodedError(err : String)
    }
}
