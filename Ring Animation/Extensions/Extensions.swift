//
//  Extensions.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 7.07.2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    public func makeAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
