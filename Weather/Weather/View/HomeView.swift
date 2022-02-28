//
//  HomeView.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/5/21.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject private var network = AutoComplete()
    @State private var searchText = ""
    @State var favCities: [String] = []
    @State var isParentHome: Bool = false
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor.white
//    }
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 255, green: 255, blue: 255))]
        UINavigationBar.appearance().barTintColor = UIColor.init(Color(red: 255, green: 255, blue: 255))
    }
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image("App_background")
                    .resizable()
                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//                    .ignoresSafeArea(.keyboard)
                
                VStack{

                        
                            SearchBar(text: "")
                                .environmentObject(network)
                                .frame(width: 400)
                                .offset(x:0, y:-20)
                    //if inherit from parent
                    if isParentHome{Text("cityViewModel.city")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .offset(x: 0, y: 12)
                        
                        
                        Text("cityViewModel.city")
                            .font(Font.system(size: 60))
                            .fontWeight(.bold)
                            .padding()}
                    
                    
                    TabView {
                        SpringView(cityName: "Los Angeles")
                        
                        ForEach(favCities, id: \.self){ city in
                            Bonner(cityName: city, addFavourite: true)
//                                .tag(city.tag)
                        }
//                        SpringView(cityName: "Las Vegas")
                    }
                    .tabViewStyle(.page)
//                    .padding(.bottom, 100)
                }
                .ignoresSafeArea(.keyboard)
                .onTapGesture {
                    self.isParentHome = false
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
        }
//        .ignoresSafeArea(.keyboard)
        


    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
