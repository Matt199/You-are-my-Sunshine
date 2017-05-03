//
//  kbController.swift
//  Space App
//
//  Created by Space Apps Challenge  on 03.05.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {

    func hideKeyboard() {
    
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }


}
