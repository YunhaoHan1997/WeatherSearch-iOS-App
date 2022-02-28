//
//  ContentView.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/5/21.
//

import SwiftUI
import SwiftyJSON
import Alamofire
import Toast_Swift
import SwiftSpinner
import Highcharts

struct ContentView: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack{
            if self.isActive {
                HomeView()
            } else {
                ZStack{
                    Image("App_background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Spacer()
                        Image("Mostly Clear")
                        Spacer()
                        Image("Powered_by_Tomorrow-Black")
                            .resizable()
                            .frame(width: 300, height: 30, alignment: .center)
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isActive = true
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
