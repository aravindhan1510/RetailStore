//
//  ProductDetailsViewModel.swift
//  RetailStore
//
//  Created by Aravindhan on 16/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
/** View model class for product details view controller */
class ProductDetailsViewModel: NSObject {
    var product: Product?
    let dataStorage = DataStorageManager()
    /**
     Method to get the product name
     - parameters:
         - indexPath: Index path
     - returns:
         Name of the product
     */
    func getProductName() -> String {
        var resultString = ""
        if let result = product?.productName {
            resultString = result
        }
        return resultString
    }
    /**
     Method to get the product image
     - parameters:
         - indexPath: Index path
     - returns:
         Image name of the product
     */
    func getProductImage() -> String {
        var resultString = ""
        if let result = product?.productImage {
            resultString = result
        }
        return resultString
    }
    /**
     Method to get the product price
     - parameters:
         - indexPath: Index path
     - returns:
         Price of the product
     */
    func getProductPrice() -> String {
        var resultString = ""
        if let result = product?.productPrice {
            resultString = String(format:"₹%d",result)
        }
        return resultString
    }
    /**
     Method inserts product details data which is added to cart in the core data
     */
    func insert() {
        dataStorage.insertProduct(withDetails: product!)
    } 
}
