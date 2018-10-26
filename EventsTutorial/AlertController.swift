//
//  AlertController.swift
//  EventsApp
//
//  Created by Alejandro Carbajal on 10/25/18.
//  Copyright © 2018 Alejandro Carbajal. All rights reserved.
//

import UIKit

class AlertController {
   static func showAlert(_ inViewController:UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
}

