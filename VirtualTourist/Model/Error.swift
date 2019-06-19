//
//  Error.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/28/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayError(_ errorString: String?) {
        let alert = UIAlertController(title: "Error!", message: errorString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}

