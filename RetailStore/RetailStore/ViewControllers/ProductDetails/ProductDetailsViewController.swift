//
//  ProductDetailsViewController.swift
//  RetailStore
//
//  Created by Aravindhan on 16/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
class ProductDetailsViewController: UIViewController {
    let productDetailsModel = ProductDetailsViewModel()
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var btnAddToCart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()     
    }
    override func viewWillAppear(_ animated: Bool) {
       setData()
    }
    func setData() {
        lblProductName.text = productDetailsModel.getProductName()
        lblProductPrice.text = productDetailsModel.getProductPrice()
        productImage.image = UIImage(named:productDetailsModel.getProductImage())
        btnAddToCart.setTitle(NSLocalizedString("Add to cart", comment: ""), for: .normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.kProductDetailsToCartSegue, sender: nil)
    }
    @IBAction func addToCartTapped(_ sender: Any) {
        productDetailsModel.insert()
        Utilities.showAlertView(withMessage: NSLocalizedString("Product added to cart successfully", comment: ""), inViewController: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
