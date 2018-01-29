//
//  CartTableViewCell.swift
//  RetailStore
//
//  Created by Aravindhan on 16/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    var delegate: CartTableViewCellDelegate?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var deleteButton: DeleteButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func deleteButtonTapped(_ sender: DeleteButton) {
        delegate?.cellDeleteButtonTapped(sender: sender)
    }
}
