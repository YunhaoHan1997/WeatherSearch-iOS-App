//
//  SpinnerView.swift
//  WeatherSearch
//
//  Created by 韩云昊 on 12/7/21.
//

import SwiftUI
import Toast_Swift

struct SpinnerView: View {
    @EnvironmentObject var network: GetDailyWeather
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
//                self.network.getWeather(address: "Las Vegas")
                Toast()
            }
        
//            ForEach(self.network.weathers){ weather in
//                Text(weather.startTime)
//                
//            }
        
        
//        self.view.showToast("hahha")
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
