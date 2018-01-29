//
//  CategoriesViewModel.swift
//  RetailStore
//
//  Created by Aravindhan on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
/** View model class for categories view controller */
class CategoriesViewModel: NSObject {
    var categories = [Categories]()
    /**
     Method to get the categories list from the Json
     */
    func getCategories() {
        if let data = Utilities.readJson(filename:Constants.kCategoriesFileName) as? [[String: Any]] {
            var jobs = [Categories]()
            for datum in data {
                if let job = Categories(data: datum as NSDictionary) {
                    jobs.append(job)
                }
            }
            self.categories.removeAll()
            self.categories.append(contentsOf: jobs)
        }
    }
    /**
     Method to get the categories model at the given index path
     - parameters:
         - indexPath: Index path
     
     */
    func getCategoryAtIndexPath(_ indexPath: IndexPath) -> Categories {
        return categories[indexPath.row]
    }
    /**
     Method to get the category name at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Name of the category
     */
    func categoryNameForItemAtIndexPath(_ indexPath: IndexPath) -> String {
        return (categories[indexPath.row].category)
    }
    /**
     Method to get the category image at the given index path
     - parameters:
         - indexPath: Index path
     - returns:
         Image name of the category
     */
    func categoryImageForItemAtIndexPath(_ indexPath: IndexPath) -> String {
        return (categories[indexPath.row].image)
    }
    /**
     Method to get number of items sections
     - parameters:
         - section: section
     - returns:
         Returns number of sections for collection view
     */
    func numberOfItemsInSection(_ section: Int) -> Int {
      return categories.count
    }
}
