//
//  Categories.swift
//  RetailStore
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import Foundation
struct Categories {
    enum JsonKey: String {
        case category, image
    }
    let category: String
    let image: String
    init?(data: NSDictionary) {
        if let category = data.value(forKeyPath: JsonKey.category.rawValue) as? String{
       if let image = data.value(forKeyPath: JsonKey.image.rawValue) as? String{
        self.category = category
        self.image = image
       } else {
        return nil
            }
        } else {
            return nil
        }
    }
}
