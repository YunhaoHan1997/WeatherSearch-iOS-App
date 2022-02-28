//
//  SearchBar.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/6/21.
//

import SwiftUI

struct SearchBar: View {
    @State var text: String
    @State private var isEditing = false
    @EnvironmentObject var network: AutoComplete
    
    var body: some View {
        VStack{
            HStack {
                TextField("Enter City Name...", text: $text)
                    .onChange(of: text){value in
                        if(isEditing){
                            self.network.getcities(keyword: value)
                        }
                    }
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                    self.isEditing = false
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    
                    .onTapGesture {
//                        if !self.text.isEmpty{
                            self.isEditing = true
//                        }
                        
                    }
                
//                if isEditing {
//                    Button(action: {
//                        self.isEditing = false
//                        self.text = ""
//
//
//                    }) {
//                        Text("Cancel")
//                    }
//                    .padding(.trailing, 10)
//                    .transition(.move(edge: .trailing))
//                    .animation(.default)
//                }
                    
            }
//            Spacer()
            if isEditing{
//                ScrollView{
                    List {
                        ForEach(network.cities, id: \.self) { city in
                            NavigationLink(destination: Bonner(cityName: city)) {
                                Text(city)
                            }
                            .onTapGesture {
                                isEditing = false
                                self.text = city
                                // Dismiss the keyboard
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                        }
                    }
                    .background(Color.white.opacity(0.8))
                    .frame(width: 380, height: 200)
//                }
//                .frame(width: 380, height: 200)
//
//                .padding(.top, 50)
                
            }
           
        }
        
    }
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: "")
    }
}
