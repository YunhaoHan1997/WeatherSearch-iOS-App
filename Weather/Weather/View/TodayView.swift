//
//  TodayView.swift.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/6/21.
//

import SwiftUI
import SwiftyJSON

struct TodayView: View {
    @State var myJSON: JSON
    private var values: [Any]{
        return TrimData.getTodayValues(cityJSON: myJSON)
    }
    @State var showView = false
    var body: some View {
        ZStack{
            Image("App_background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.keyboard)
            
            VStack{
                if showView {
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
                HStack{
                    TodayChart(imageName: "WindSpeed", number: "\(values[0])", name: "Wind Speed")
                    TodayChart(imageName: "Pressure", number: "\(values[1])", name: "Pressure")
                    TodayChart(imageName: "Precipitation", number: "\(values[2])", name: "Precipitation")
                }
                .padding()
                HStack{
                    TodayChart(imageName: "Temperature", number: "\(values[3])", name: "Temperature")
                    TodayChart(imageName: "\(values[4])", number: "", name: "\(values[4])")
                    TodayChart(imageName: "Humidity", number: "\(values[5])", name: "Humidity")
                }
                .padding()
                HStack{
                    TodayChart(imageName: "Visibility", number: "\(values[6])", name: "Visibility")
                    TodayChart(imageName: "CloudCover", number: "\(values[7])", name: "Cloud Cover")
                    TodayChart(imageName: "UVIndex", number: "\(values[8])", name: "UVIndex")
                }
                .padding()
            }
        }
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(myJSON: TrimData.getSampleJSON())
            .frame(width: 1000, height: 1000)
            .background(.blue.opacity(0.3))
            
    }
}
