//
//  Protocols.swift
//  RetailStore
//
//  Created by Aravindhan on 16/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import Foundation
// Protocol for delete action on the cart
public protocol CartTableViewCellDelegate {
    func cellDeleteButtonTapped(sender:DeleteButton)
}
