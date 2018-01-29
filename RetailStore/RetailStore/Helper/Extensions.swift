//
//  Extensions.swift
//  RetailStore
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//
import UIKit
// Extension for NSDate to the current date and time.
extension NSDate
{
    func  getTimestamp() -> String{
        let date = self as Date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let strFromatedDate: String = formatter.string(from: date)
        return strFromatedDate
    }
}

