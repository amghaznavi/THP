//
//  ProductListCollectionViewCell.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate(set) var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static let identifier = "ProductListCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductListCollectionViewCell", bundle: nil)
    }
    
    func setup(url: String) {
        let urlString = "https://riverisland.scene7.com/is/image/RiverIsland/\(url)_main"
        productImageView.loadImageFromURL(urlString: urlString, placeHolder: UIImage(named: "PlaceHolderLogo"))
    }
    
}
  
