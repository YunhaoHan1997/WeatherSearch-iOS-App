//
//  SpringView.swift.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/5/21.
//

import SwiftUI
import Foundation
import SwiftyJSON
import Alamofire

struct SpringView: View {
    @State var cityName: String
    @State var showAnimation = true
    @State var hasView: Bool = false
    
    var cityJSON: JSON{
          return TrimData.getJsonByCity(city: cityName)
      }
    
//    init(){
//        self.cityJSON = TrimData.getSampleJSON(city: "")
//    }
    var humidity: String{
        return String(format: "%.2f",TrimData.getTodayValues(cityJSON: cityJSON)[5] as! Double)
    }
    
    var windSpeed: String{
        return String(format: "%.2f",TrimData.getTodayValues(cityJSON: cityJSON)[0] as! Double)
    }
    
    var visibility: String{
        let a : Double = TrimData.getTodayValues(cityJSON: cityJSON)[6] as! Double
        return String(format: "%.2f", a)
        
    }
    
    var pressure : String{
        return String(format: "%.2f",TrimData.getTodayValues(cityJSON: cityJSON)[1] as! Double)
    }
    
    var dailyArray:Array<JSON>{
        return cityJSON[0]["intervals"].arrayValue
    }
    var todayTemperature: String{
        return String(format:"%.2f", cityJSON[0]["intervals"][0]["values"]["temperature"].doubleValue )
    }
    var weatherName: String{
        let weatherCode = cityJSON[0]["intervals"][0]["values"]["weatherCode"].intValue
        return TrimData.getWeatherNameFromCode(weatherCode: weatherCode)
    }
    
    
    
    var body: some View {
        ZStack {
            ZStack {
                Image("App_background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea(.keyboard)
                    
                
                VStack{
        //            Spacer()
                    
                    NavigationLink(destination: DetailsView(cityJSON: cityJSON, cityName: cityName)) {
                        ZStack{
                            
                            if hasView {
                                HStack{
                                    Spacer()
                                    Spacer()
                                    HStack{
                                        Image(systemName: "wind")
                                        Text("cityViewModel.windSpeed) km/h")
                                    }
                                    
                                    Spacer()
                                    HStack{
                                        
                                        Image(systemName: "drop")
                                        Text("cityViewModel")
                                    }
                                    Spacer()
                                    Spacer()
                                }
                                
                                Text("cityViewModel.city")
                                    .font(Font.system(size: 40))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 15)
                                
                                Text("cityViewModel.city")
                                    .font(Font.system(size: 14))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                                    .padding(.vertical, 2)
                                
            //                    cityViewModel.getWeatherIcon(icon: cityViewModel.weatherIcon)
            //                        .resizable()
            //                        .offset(x: 0, y: 12)
                                    
            //                        .aspectRatio(contentMode: .fit)
            //                        .frame(width: 125, height: 125, alignment: .center)
                                
                                Text("cityViewModel.city")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .offset(x: 0, y: 12)
                                
                                
                                Text("cityViewModel.city")
                                    .font(Font.system(size: 60))
                                    .fontWeight(.bold)
                                    .padding()
                                
                            }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.white.opacity(0.5), lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                                .frame(width: 380, height: 180)
                            
                            HStack{
                                Image("\(weatherName)")
                                    .resizable()
                                    .frame(width: 120, height: 120)
        //                            .background(Color.green)
                                    .padding(20)
                                    .padding(.leading, -40)
                                    .onTapGesture {
                                        self.hasView = false
                                    }
                    
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("\(todayTemperature) °F")
                                        .padding(.top)
                                        .padding(.bottom)
                                        .font(.system(size: 30, weight: .bold))
                                        
                                    Text("\(weatherName)")
                                        .font(.system(size: 25))
            //                            .padding()
                                    Text("\(cityName)")
                                        .padding(.top)
                                        .padding(.bottom)
                                        .font(.system(size: 20, weight: .bold))
                                }
                                Spacer()
                                    .onTapGesture {
                                        self.hasView = false
                                    }
                            }
                            .frame(width: 300, height: 180)
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    HStack{
                        VStack{
                            Text("Humidity")
                                .font(.system(size: 15))
                            Image("Humidity")
                                .resizable()
                                .frame(width: 60, height: 60)
        //                        .background(Color.green)
                            Text("\(humidity)"+" %")
                                .font(.system(size: 15))
                        }
                        Spacer()
                        VStack{
                            Text("Wind Speed")
                                .font(.system(size: 15))
                            Image("WindSpeed")
                                .resizable()
                                .frame(width: 60, height: 60)
        //                        .background(Color.green)
                            Text("\(windSpeed)"+" mph")
                                .font(.system(size: 15))
                        }
                        Spacer()
                        VStack{
                            Text("Visibility")
                                .font(.system(size: 15))
                            Image("Visibility")
                                .resizable()
                                .frame(width: 60, height: 60)
        //                        .background(Color.green)
                            Text("\(visibility)"+" mi")
                                .font(.system(size: 15))
                        }
                        Spacer()
                        VStack{
                            Text("Pressure")
                                .font(.system(size: 15))
                            Image("Pressure")
                                .resizable()
                                .frame(width: 60, height: 60)
        //                        .background(Color.green)
                            Text("\(pressure)"+" inHg")
                                .font(.system(size: 15))
                        }
                    }
                    .frame(width: 380)
                    .onTapGesture {
                        self.hasView = false
                    }
                    
                    ScrollView{
                        ForEach(0..<dailyArray.count) { i in
                            HStack{
                                Text("\(TrimData.getDate(index: i, json: cityJSON))")
                                    .font(.system(size: 18))
                                Image("\(TrimData.getWeatherNameIterative(index: i, json: cityJSON))")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("\(TrimData.getSunRise(index: i, json: cityJSON))")
                                    .font(.system(size: 18))
                                Image("sun-rise")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("\(TrimData.getSunSet(index: i, json: cityJSON))")
                                    .font(.system(size: 18))
                                Image("sun-set")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .cornerRadius(15)
                            Divider()
                        }
                    }
                    //set view bar's attribute
                    .cornerRadius(15)
                    .frame(width: 380, height: 250)
                    .background(Color.white.opacity(0.8))
                    .padding(.top, 50)
                    Spacer()
                }
                .padding(.top, 50)
            }
//            show spinner
            if (showAnimation){
                Spinner1()
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.showAnimation = false
            }
        }
    }
}

struct SpringView_Previews: PreviewProvider {
    static var previews: some View {
        SpringView(cityName: "LA")
            .background(Color.blue.opacity(0.3))
    }
}
