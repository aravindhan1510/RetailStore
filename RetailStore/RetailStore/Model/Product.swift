//
//  Product.swift
//  RetailStore
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import Foundation
struct Product {
    enum JsonKey: String {
        case productId, productName,productImage,productPrice,timeStamp
    }
    let productId: Int
    let productName: String
    let productImage: String
    let productPrice: Int
    let timeStamp : String
    init?(data: NSDictionary) {
        if let productId = data.value(forKeyPath: JsonKey.productId.rawValue) as? Int,
        let productName = data.value(forKeyPath: JsonKey.productName.rawValue) as? String,
        let productImage = data.value(forKeyPath: JsonKey.productImage.rawValue) as? String,
        let productPrice = data.value(forKeyPath: JsonKey.productPrice.rawValue) as? Int,
        let timeStamp = data.value(forKeyPath: JsonKey.timeStamp.rawValue) as? String
        {
            self.productId = productId
            self.productName = productName
            self.productImage = productImage
            self.productPrice = productPrice
            self.timeStamp = timeStamp
        } else {
            return nil
        }
    }
}
