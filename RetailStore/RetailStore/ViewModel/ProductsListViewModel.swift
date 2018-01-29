//
//  CategoriesViewModel.swift
//  RetailStore
//
//  Created by Aravindhan on 15/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
/** View model class for products list view controller*/
class ProductsListViewModel: NSObject {
    var productList = [ProductList]()
    /**
     Method to get the products list from the Json
     */
    func getProducts() {
        if let data = Utilities.readJson(filename:Constants.kProductsFileName) as? [[String: Any]] {
            var jobs = [ProductList]()
            for datum in data {
                if let job = ProductList(data: datum as NSDictionary) {
                    jobs.append(job)
                }
            }
            self.productList.removeAll()
            self.productList.append(contentsOf: jobs)
        }
    }
    /**
     Method to get the category name at the given index path
     - parameters:
     - indexPath: Index path
     
     */
    func getCategoryAtIndexPath(_ indexPath: IndexPath) -> String {
        return productList[indexPath.row].category
    }
    /**
     Method to get the product name at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Name of the product
     */
    func productNameForItemAtIndexPath(selectedCategoryIndexPath: IndexPath,indexPath: IndexPath) -> String {
        return productList[selectedCategoryIndexPath.row].products[indexPath.row].productName
    }
    /**
     Method to get the product image at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Image name of the product
     */
    func productImageForItemAtIndexPath(selectedCategoryIndexPath: IndexPath,indexPath: IndexPath) -> String {
        return productList[selectedCategoryIndexPath.row].products[indexPath.row].productImage
    }
    /**
     Method to get the product model at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Product model
     */
    func getProductAtIndexPath(selectedCategoryIndexPath: IndexPath,indexPath: IndexPath) -> Product {
        return productList[selectedCategoryIndexPath.row].products[indexPath.row]
    }
    /**
     Method to get number of items sections
     - parameters:
         - section: section
     - returns:
        Returns number of sections for collection view
     */
    func numberOfItemsInSection(_ indexPath: IndexPath) -> Int {
      return productList[indexPath.row].products.count
    }
}
