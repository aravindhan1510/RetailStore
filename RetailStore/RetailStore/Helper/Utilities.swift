//
//  Utilities.swift
//  RetailStore
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
/** Class which has the utility methods */
class Utilities: NSObject {
    /**
     Method to show an alert view with message.
     - parameters:
         - withMessage: Message which needs to be displayed in the alert.
         - inViewController: View controller in which the alert needs to be displayed.
     
     */
    class func showAlertView(withMessage message: String,inViewController:UIViewController) {
        let alertView = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                   style: .default, handler: { (alert) in
        })
        alertView.addAction(action)
        inViewController.present(alertView, animated: true, completion: nil)
    }
    /**
     Method to read and access the contents of Json file
     - parameters:
         - filename: Name of the Json file
     - returns:
         The contents of the Json file
     
     */
    class func readJson(filename:String) -> Any? {
        do {
            if let file = Bundle.main.url(forResource: filename, withExtension: Constants.kJsonExtension) {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    return object
                } else if let object = json as? [Any] {
                    return object
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
