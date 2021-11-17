//
//  ProductListViewController.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var extraview : UIView = UIView()
    var productResult: [Products] = []
    
    @IBOutlet weak var productListcollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PRODUCTS"
        
        config()
        networkEngine()
    }
    
    func config() {
        productListcollectionView.register(ProductListCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductListCollectionViewCell.identifier)
        productListcollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        productListcollectionView.delegate = self
        productListcollectionView.dataSource = self
    }
    
    func networkEngine() {
        NetworkManager.request(endpoint: ProductEndpoint.getSearchResults(searchText: "")) { (result: Result<ProductResponse, Error>) in
            switch result {
            case .success(let response):
                self.productResult = response.products
                self.productListcollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}





//MARK: - CollectionView Delegates

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailVC : ProductDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailViewController
        productDetailVC.selectedImage = self.productResult[indexPath.row].prodid
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productResult.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = productResult[indexPath.row].prodid
        let productName = productResult[indexPath.row].name
        let productCost = productResult[indexPath.row].cost
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.identifier, for: indexPath) as! ProductListCollectionViewCell
        cell.setup(url: imageURLString)
        cell.titleLabel.text = productName.uppercased()
        cell.costLabel.text = productCost.currencyFormatting()
        return cell
    }
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.size.width
        return CGSize(width: (w - 2) / 2, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}


