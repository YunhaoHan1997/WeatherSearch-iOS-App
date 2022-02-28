//
//  SpinningGraphController.swift
//  WeatherSearch571
//
//  Created by 韩云昊 on 12/7/21.
//

import Foundation
import SwiftSpinner
import SwiftUI

class SpinnerViewController1: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftSpinner.show(duration: 2.0, title:"Loading...")
    }
}

struct Spinner1: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> SpinnerViewController1 {
            return SpinnerViewController1()
        }
        
    func updateUIViewController(_ uiViewController: SpinnerViewController1, context: Context) {
        
    }
}


class SpinnerViewController2: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftSpinner.show(duration: 2.0, title:"Fetching Weather Details for Las Vegas...")
    }
}

struct Spinner2: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> SpinnerViewController2 {
            return SpinnerViewController2()
        }
        
    func updateUIViewController(_ uiViewController: SpinnerViewController2, context: Context) {
        
    }
}


class SpinnerViewController3: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftSpinner.show(duration: 2.0, title:"Fetching Weather Details for Las Vegas...")
    }
}

struct Spinner3: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> SpinnerViewController3 {
            return SpinnerViewController3()
        }
        
    func updateUIViewController(_ uiViewController: SpinnerViewController3, context: Context) {
        
    }
}
