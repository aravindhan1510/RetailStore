//
//  CartViewController.swift
//  RetailStore
//
//  Created by Aravindhan on 16/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit

class CartViewController: UIViewController{
    @IBOutlet weak var lblTotalDescription: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    let cartViewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
     setData()
     getCurrentCartDetails()
    }
    func setData() {
        self.title = NSLocalizedString("Cart", comment: "")
        lblTotalDescription.text =  NSLocalizedString("Total Price", comment: "")
    }
    func getCurrentCartDetails() {
        cartViewModel.getProducts()
        lblTotal.text = cartViewModel.getCartTotalPrice()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.kCartToProductSegue) {
            let productDetailsController = segue.destination as! ProductDetailsViewController
            if let indexPath = sender as? IndexPath {
                productDetailsController.productDetailsModel.product = cartViewModel.getProductAtIndexPath(indexPath)
            }
        }
    }
}
// Extension for Deletion Delegate
extension CartViewController : CartTableViewCellDelegate{
    // Handles the product deletion
    internal func cellDeleteButtonTapped(sender: DeleteButton) {
     if let indexPath = sender.indexPath {
        cartViewModel.deleteProduct(record:cartViewModel.getProductAtIndexPath(indexPath))
        getCurrentCartDetails()
        cartTableView.reloadData()
        }
    }
}
// Extension for the TableView Delegate and Datasource
extension CartViewController : UITableViewDataSource, UITableViewDelegate {
    //MARK: - Table view delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartViewModel.numberOfRowsInSection(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell = tableView.dequeueReusableCell(withIdentifier: Constants.kCartCellIdentifier, for: indexPath) as! CartTableViewCell
        cartCell.delegate = self
        cartCell.productImage.image = UIImage(named:cartViewModel.getProductImageForItemAtIndexPath(indexPath))
        cartCell.lblProductName.text = cartViewModel.getProductNameForItemAtIndexPath(indexPath)
        cartCell.lblProductPrice.text = cartViewModel.getProductPriceForItemAtIndexPath(indexPath)
        cartCell.deleteButton.indexPath = indexPath
        return cartCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var isViewControllerAvailable = false
        let stack = self.navigationController?.viewControllers
        // Checking whether the procuct details view controller is already there in the navigation stack. If it is available in the stack, then poping to that existing controller to avoid the cyclic push between product details and cart
        for viewController in stack! {
            if(viewController.isKind(of: ProductDetailsViewController.self) )
            {
                if let productDetailsController = viewController as? ProductDetailsViewController {
                      productDetailsController.productDetailsModel.product = cartViewModel.getProductAtIndexPath(indexPath)
                }
                self.navigationController?.popToViewController(viewController, animated: true)
                isViewControllerAvailable = true
            }
        }
        if isViewControllerAvailable == false {
            self.performSegue(withIdentifier: Constants.kCartToProductSegue, sender: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.kCartTableViewRowHeight)
    }
}
