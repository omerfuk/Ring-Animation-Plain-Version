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
    
    public func makeAlertWithText(title: String,
                                  message:String,
                                  actionButtonTitle:String,
                                  cancelButtonTitle:String,
                                  placeholder1:String,
                                  placeholder2:String,
                                  completion: @escaping (String, String) -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = placeholder1
            }
            let saveAction = UIAlertAction(title: actionButtonTitle, style: .default, handler: { alert -> Void in
                
                completion(alertController.textFields?[0].text ?? "", alertController.textFields?[1].text ?? "")
                
            })
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .default, handler: { (action : UIAlertAction!) -> Void in })
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = placeholder2
            }

            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
    }
}
