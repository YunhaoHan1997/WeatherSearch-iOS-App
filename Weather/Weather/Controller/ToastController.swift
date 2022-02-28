//
//  ToastController.swift
//  WeatherSearch
//
//  Created by 韩云昊 on 12/7/21.
//

import Foundation
import Toast_Swift
import SwiftUI

class ToastViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.makeToast("This is a piece of toast")
    }
}

struct Toast: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> ToastViewController {
            return ToastViewController()
        }

    func updateUIViewController(_ uiViewController: ToastViewController, context: Context) {

    }
}

