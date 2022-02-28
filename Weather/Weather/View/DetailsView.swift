//
//  DetailsView.swift.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/6/21.
//

import SwiftUI
import UIKit
import SwiftyJSON

struct DetailsView: View {
    @State var myJSON: JSON
    @State var myName: String
    @State var favCities: [String] = []
    var date: String{
        return TrimData.getDate(index: 0, json: myJSON)
    }
    var temp: String{
        return String(format:"%.2f", myJSON[0]["intervals"][0]["values"]["temperature"].doubleValue )
//        return String(TrimData.getTodayValues(cityJSON: myJSON)[4] as! Double)
    }
    var weatherName = "Clear"
    
    init(cityJSON: JSON, cityName: String) {
        UITabBar.appearance().backgroundColor = UIColor.white
        myJSON = cityJSON
        myName = cityName
    }
    
    var body: some View {
        TabView{
            TodayView(myJSON: myJSON)
                .tabItem {
                    Label("TODAY", image: "Today_Tab")
                }
            WeeklyView(myJSON: myJSON)
                .tabItem {
                    Label("WEEKLY", image: "Weekly_Tab")
                }
            WeatherDataView(myJSON: myJSON)
                .tabItem {
                    Label("WEATHER DATA", image: "Weather_Data_Tab")
                }
        }
        .accentColor( .blue)
//        .navigationTitle(myName)
        .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("\(myName)").foregroundColor(.black)
                        }
                    }
                }
        .toolbar {
            Link(destination: URL(string: "https://twitter.com/intent/tweet?text=The+temperature+in+Los+Angeles+is+\(temp)+%C2%B0F.+The+weather+conditions+are+\(weatherName)&amp;hashtags=CSCI571WeatherForecast")!) {
                    Image("twitter")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(cityJSON: TrimData.getSampleJSON(), cityName: "Los Angeles")
    }
}
