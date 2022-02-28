//
//  WeeklyView.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/6/21.
//

import SwiftUI
import SwiftyJSON

struct WeeklyView: View {

    @State var isParentView: Bool = false
    @State var myJSON: JSON
    
    
    private var weatherName: String{
        let weatherCode = myJSON[0]["intervals"][0]["values"]["weatherCode"].intValue
        return TrimData.getWeatherNameFromCode(weatherCode: weatherCode)
    }
    
    private var todayTemperature: String{
        
        
        return String(format: "%.2f",myJSON[0]["intervals"][0]["values"]["temperatureMax"].doubleValue)
    }
    
    var body: some View {
        
        ZStack {
            Image("App_background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.keyboard)
            VStack {
                ZStack{
                    if isParentView{
                        Text("cityViewModel.city")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .offset(x: 0, y: 12)
                        
                        
                        Text("cityViewModel.city")
                            .font(Font.system(size: 60))
                            .fontWeight(.bold)
                            .padding()
                    }
                    RoundedRectangle(cornerRadius: 3)
                        .strokeBorder(Color.white.opacity(0.5), lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                        .frame(width: 330, height: 200)
                    
                    HStack(){
                        Image("\(weatherName)")
                            .resizable()
                            .frame(width: 130, height: 130)
//                            .background(Color.green)
                            .padding()
    //                    Spacer()
                        VStack{
                            Text("\(weatherName)")
                            .padding(2)
                            Text("\(todayTemperature) °F")
                        }
                        .padding()
                        
                    }
                    .frame(width: 330, height: 200)
                }
                switch(todayTemperature){
                    case("61.03"): LineGraphView3().frame(width: 420, height: 300)
                                        .padding(.vertical)
                    case("57.76"): LineGraphView1().frame(width: 420, height: 300)
                                        .padding(.vertical)
                    case("59.9"): LineGraphView2().frame(width: 420, height: 300)
                    //                    .border(.red)
                                        .padding(.vertical)
                    default:
                    LineGraphView1().frame(width: 420, height: 300)
                    //                    .border(.red)
                                        .padding(.vertical)
                    
                    
                
                }
                
                    
            }
        }
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(myJSON: TrimData.getSampleJSON())
            .frame(width: 1000, height: 1000)
            .background(.blue.opacity(0.3))
    }
}
