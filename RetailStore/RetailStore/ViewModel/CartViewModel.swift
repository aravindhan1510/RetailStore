//
//  CartViewModel.swift
//  RetailStore
//
//  Created by Aravindhan on 16/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
/** View model class for cart view controller */
class CartViewModel: NSObject {
    let dataStorage = DataStorageManager()
    var products = [Product]()
    /**
     This method will fetch all the product details from core data
     */
    func getProducts() {
       products = dataStorage.fetchProductsDetails()
    }
    /**
     Method to calculate the total price of the products in cart
     - returns:
         Returns the total price of the producrts in cart
     
     */
    func getCartTotalPrice() -> String{
        var total = Int()
        let products = dataStorage.fetchProductsDetails()
        for records in products {
            total += records.productPrice
        }
        return String(format:"₹%d",total)
    }
    /**
     This method deletes product details data in the core data
     - parameters:
     - record: Product model which contains the product details to be deleted
     
     */
    func deleteProduct(record:Product) {
       dataStorage.deleteProduct(record: record)
    }
    /**
     Method to get number of rows in sections
     - parameters:
         - section: section
     - returns:
         Returns number of rows insections for table view
     */
    func numberOfRowsInSection(_ section: Int) -> Int {
        return products.count
    }
    /**
     Method to get the product model at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Product model
     */
    func getProductAtIndexPath(_ indexPath: IndexPath) -> Product {
        return products[indexPath.row]
    }
    /**
     Method to get the product name at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Name of the product
     */
    func getProductNameForItemAtIndexPath(_ indexPath: IndexPath) -> String {
        return (products[indexPath.row].productName)
    }
    /**
     Method to get the product image at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Image name of the product
     */
    func getProductImageForItemAtIndexPath(_ indexPath: IndexPath) -> String {
        return (products[indexPath.row].productImage)
    }
    /**
     Method to get the product price at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Image name of the product
     */
    func getProductPriceForItemAtIndexPath(_ indexPath: IndexPath) -> String {
        return String(format:"₹%d",products[indexPath.row].productPrice)
    }
}
