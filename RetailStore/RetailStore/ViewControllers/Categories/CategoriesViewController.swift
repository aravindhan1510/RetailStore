//
//  CategoriesViewController.swift
//  RetailStore
//
//  Created by Aravind on 14/01/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
class CategoriesViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    var categoryViewModel = CategoriesViewModel()
    var selectedCategory = String()
    var selectedCategoryIndex = IndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Retail Store", comment: "")
    }
    override func viewWillAppear(_ animated: Bool) {
        // Fetching the category list from the Json file
         categoryViewModel.getCategories()
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.kCategoriesToCartSegue, sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.kCategoryListSegue) {
            let productsListController = segue.destination as! ProductsListViewController
                productsListController.selectedCategoryIndex = selectedCategoryIndex
        }
    }
}

// Extension for the Collection View delegate and data source
extension CategoriesViewController : UICollectionViewDataSource,UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.numberOfItemsInSection(section)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategoryIndex = indexPath
        self.performSegue(withIdentifier: Constants.kCategoryListSegue, sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kCategoriesCellIdentifier,for:indexPath) as! CategoriesCollectionViewCell
        cell.categoryName.text = categoryViewModel.categoryNameForItemAtIndexPath(indexPath)
        cell.categoryImage.image = UIImage(named:categoryViewModel.categoryImageForItemAtIndexPath(indexPath))
        cell.layoutIfNeeded()
        return cell
    }
}

