//
//  TodayChart.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/6/21.
//

import SwiftUI

struct TodayChart: View {
    @State var imageName:String
    @State var number:String
    @State var name:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 3)
                .strokeBorder(Color.white.opacity(0.5), lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                .frame(width: 105, height: 150)
            
            VStack(){
                Image(imageName)
                    .resizable()
                    .frame(width: 75, height: 75)
                    Text("\(number)")
                
                    .padding(2)
                    Text("\(name)")
                    .font(.system(size: 15))
            }
           
            .frame(width: 105, height: 150)
//            .border(Color.red)
        }
    }
}

struct TodayChart_Previews: PreviewProvider {
    static var previews: some View {
        TodayChart(imageName: "wind image", number: "0.0 mph", name: "wind speed")
            .frame(width: 300, height: 300)
            .background(Color.blue.opacity(0.3))
    }
}
