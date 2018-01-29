//
//  ProductsListViewController.swift
//  RetailStore
//
//  Created by Aravind on 15/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
class ProductsListViewController: UIViewController {
    var productsViewModel = ProductsListViewModel()
    var selectedCategoryIndex = IndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        // Fetching the products list from the Json file
        productsViewModel.getProducts()
        self.title = productsViewModel.getCategoryAtIndexPath(selectedCategoryIndex)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.kProductsToCartSegue, sender: nil)

    }
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.kProductDetailsSegue) {
            let productDetailsController = segue.destination as! ProductDetailsViewController
            if let indexPath = sender as? IndexPath {
                productDetailsController.productDetailsModel.product = productsViewModel.getProductAtIndexPath(selectedCategoryIndexPath: selectedCategoryIndex, indexPath: indexPath)
            }
        }
    }
}
// Extension for the Collection View delegate and data source
extension ProductsListViewController : UICollectionViewDataSource,UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsViewModel.numberOfItemsInSection(selectedCategoryIndex)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       self.performSegue(withIdentifier: Constants.kProductDetailsSegue, sender: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kProductsListCellIdentifier,for:indexPath) as! ProductsListCollectionViewCell
        cell.productDescription.text = productsViewModel.productNameForItemAtIndexPath(selectedCategoryIndexPath: selectedCategoryIndex,indexPath: indexPath)
        cell.productImage.image =  UIImage(named:productsViewModel.productImageForItemAtIndexPath(selectedCategoryIndexPath: selectedCategoryIndex,indexPath: indexPath))
        return cell
    }
}
