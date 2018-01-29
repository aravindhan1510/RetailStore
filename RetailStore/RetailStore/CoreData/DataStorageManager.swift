//
//  CoreDataManager.swift
//  Otsuka
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2017 Aravind. All rights reserved.
//

import UIKit
import CoreData
/** Class which manages the local data storage */
class DataStorageManager: NSObject {
    public override init() {
        do {
            try AERecord.loadCoreDataStack()
        } catch {
            print(error)
        }
    }
    /**
     This method inserts product details data which is added to cart in the core data
     - parameters:
         - withDetails: Product model which contains the product details
 
     */
    func insertProduct(withDetails: Product){
        ProductsInCart.create(with: [Constants.kProductId:withDetails.productId as Any,Constants.kProductName:withDetails.productName as Any,Constants.kProductImage:withDetails.productImage as Any,Constants.kProductPrice:withDetails.productPrice as Any,Constants.kTimeStamp: NSDate().getTimestamp()])
        AERecord.save()
    }
    /**
     This method will fetch all the product details from core data
     - returns:
         An array of Product model which contains the product details
     */
    func fetchProductsDetails() -> [Product]{
        var cartList = [Product]()
        cartList.removeAll()
        if let cartDetails = ProductsInCart.all() {
            for product in cartDetails {
                let finalProduct:NSDictionary = [
                    Constants.kProductId : Int((product as! ProductsInCart).productId),
                    Constants.kProductName : (product as! ProductsInCart).productName ?? "",
                    Constants.kProductImage : (product as! ProductsInCart).productImage ?? "",
                    Constants.kProductPrice: Int((product as! ProductsInCart).productPrice),
                    Constants.kTimeStamp : (product as! ProductsInCart).timeStamp ?? ""
                ]
               let productModel  = Product(data: finalProduct)
                if let result = productModel {
                     cartList.append(result)
                }
            }
        }
        return cartList
    }
    /**
     This method deletes product details data in the core data
     - parameters:
         - record: Product model which contains the product details to be deleted
     
     */
    func deleteProduct(record:Product) {
          ProductsInCart.deleteAll(with: Constants.kTimeStamp, value: record.timeStamp)
          AERecord.save()
    }
}
