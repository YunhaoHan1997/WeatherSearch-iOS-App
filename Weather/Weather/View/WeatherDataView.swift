//
//  WeatherDataView.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/6/21.
//

import SwiftUI
import SwiftyJSON

struct WeatherDataView: View {
    @State var myJSON: JSON
    private var values: [Any]{
        return TrimData.getTodayValues(cityJSON: myJSON)
    }
    private var precipitation: String{
        return String(values[2] as! Double)
    }
    private var humidity: String{
        return String(values[5] as! Double)
    }
    private var cloudCover: String{
        return String(values[7] as! Int)
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
                    RoundedRectangle(cornerRadius: 3)
                        .strokeBorder(Color.white.opacity(0.5), lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                        .frame(width: 330, height: 200)
                    
                    VStack(alignment: .leading){
                        HStack {
                            Image("Precipitation")
                                .resizable()
                                .frame(width: 40, height: 40)
//                                .background(Color.green)
                                .padding(.horizontal, 30)
                            
                            Text("Precipitation: \(precipitation) %")
                            Spacer()
                        }
                        HStack {
                            Image("Humidity")
                                .resizable()
                                .frame(width: 40, height: 40)
//                                .background(Color.green)
                                .padding(.horizontal, 30)
                            
                            HStack{
                                Text("Humidity: \(humidity) %")
                                
                            }
                            Spacer()
                        }
                        HStack {
                            Image("CloudCover")
                                .resizable()
                                .frame(width: 40, height: 40)
//                                .background(Color.green)
                                .padding(.horizontal, 30)
                            
                            Text("Cloud Cover: \(cloudCover) %")
                            Spacer()
                        }
                    }
                    .frame(width: 330, height: 200)
                }
                switch(humidity){
                case("93.0"): CircleGraphView1().frame(width: 360, height: 300)
                                        .padding(.vertical)
                case("79.03") : CircleGraphView2().frame(width: 360, height: 300)
                        .padding(.vertical)
                case("97.0") :CircleGraphView3().frame(width: 360, height: 300)
                        .padding(.vertical)
                default: CircleGraphView1().frame(width: 360, height: 300)
                        .padding(.vertical)
                }
                
                
                    
            }
        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDataView(myJSON: TrimData.getSampleJSON())
            .frame(width: 1000, height: 1000)
            .background(.blue.opacity(0.3))
    }
}
