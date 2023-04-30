//
//  Extension + UIViewController.swift
//  TestAppMVVM
//
//  Created by Владимир on 24.03.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {return}
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        rootViewController.present(ac, animated: true, completion: nil)
    }
}
