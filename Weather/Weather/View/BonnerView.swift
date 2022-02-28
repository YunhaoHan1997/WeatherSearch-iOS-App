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
import SwiftSpinner
import Toast_Swift

var gloabCity = ""
struct Bonner: View {
    @State var cityName: String
    @State var showToast = false
    var cityJSON: JSON{
        gloabCity = cityName
          return TrimData.getJsonByCity(city: cityName)
      }
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
    
    @State var showAnimation = true
    
    @State var addFavourite = false
    
    @State var calculator = 0
    
    
    class SpinnerViewController: UIViewController{
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            SwiftSpinner.show(duration: 2.0, title:"Fetching Weather Details for " + gloabCity + "...")
        }
    }

    struct Spinner: UIViewControllerRepresentable{
        func makeUIViewController(context: Context) -> SpinnerViewController {
                return SpinnerViewController()
            }
            
        func updateUIViewController(_ uiViewController: SpinnerViewController, context: Context) {
            
        }
    }
    
    
    
    class ToastViewController1: UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.makeToast(gloabCity + " was added to the Favorite List", duration: 2.0, position: .bottom)
        }
    }

    struct addToast: UIViewControllerRepresentable{
        func makeUIViewController(context: Context) -> ToastViewController1 {
                return ToastViewController1()
            }
            
        func updateUIViewController(_ uiViewController: ToastViewController1, context: Context) {
            
        }
    }
    
    
    class ToastViewController2: UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.makeToast(gloabCity + " was removed from the Favorite List", duration: 2.0, position: .bottom)
        }
    }

    struct removeToast: UIViewControllerRepresentable{
        func makeUIViewController(context: Context) -> ToastViewController2 {
                return ToastViewController2()
            }
            
        func updateUIViewController(_ uiViewController: ToastViewController2, context: Context) {
            
        }
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

                        HStack{
                            Spacer()
                            
                            Button(action: {
                                showToast = true
                                TrimData.operateFavCity(cityName: cityName)
                                addFavourite.toggle()
                            }){
                                if !addFavourite{
                                    Image("plus-circle")
                                        .resizable().frame(width: 30, height: 30)
                                }else{
                                    Image("close-circle")
                                        .resizable().frame(width: 30, height: 30)
                                }
                            }
                            
                                
                                
                        }.padding(.horizontal,40)
                    
                        

                    NavigationLink(destination: DetailsView(cityJSON: cityJSON, cityName: cityName)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.white.opacity(0.5), lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.3)))
                                .frame(width: 380, height: 180)
                            
                            HStack{
                                Image("\(weatherName)")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .padding(20)
                                    .padding(.leading, -40)
                                    
                    
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
                            }
                            .frame(width: 300, height: 180)
                        }
//                        .padding(.top, 30)
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
                            Text("\(humidity)" + "%")
                                .font(.system(size: 15))
                        }
                        Spacer()
                        VStack{
                            Text("Wind Speed")
                                .font(.system(size: 15))
                            Image("WindSpeed")
                                .resizable()
                                .frame(width: 60, height: 60)
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
                            Text("\(pressure)"+" inHg")
                                .font(.system(size: 15))
                        }
                        
                    }
                    .frame(width: 380)
                    
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
                            Divider()
                        }
                        .cornerRadius(15)
                    }
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
                Spinner()
            }
            if (showToast){
//                print(" true")
                if(addFavourite){
                    addToast()
                        .onReceive(timer){_ in
                            if calculator % 3 == 0{
                                showToast.toggle()
                            }
                            calculator += calculator
                        }
                }
                else{
//                    print("showtoast is false")
                    removeToast()
                        .onReceive(timer){_ in
                            if calculator % 3 == 0{
                                showToast.toggle()
                            }
                            calculator += calculator
                        }
                }
            }
        }
        .onAppear {
            self.addFavourite = TrimData.check(cityName: self.cityName)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.showAnimation = false
            }
            
        }
        .navigationTitle(cityName)
        .toolbar {
            Link(destination: URL(string: "https://www.baidu.com")!) {
                    Image("twitter")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
        }
    }
}

struct Bonner_Previews: PreviewProvider {
    static var previews: some View {
        Bonner(cityName: "LA")
            .background(Color.blue.opacity(0.3))
    }
}



