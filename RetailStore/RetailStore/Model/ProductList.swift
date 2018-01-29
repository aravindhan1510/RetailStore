//
//  ProductList.swift
//  RetailStore
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import Foundation
struct ProductList {
    enum JsonKey: String {
        case category, products
    }
    let products: [Product]
    let category: String
    init?(data: NSDictionary) {
        if let category = data.value(forKeyPath: JsonKey.category.rawValue) as? String{
                var products = [Product]()
                if let processEntities = data.value(forKeyPath: JsonKey.products.rawValue) as? NSArray {
                    for mediaData in processEntities {
                        if let process = Product(data: mediaData as! NSDictionary) {
                            products.append(process)
                        }
                    }
                }  else {
                  return nil
            }
            self.products = products
            self.category = category
            } else {
                return nil
            }
        }
    }

