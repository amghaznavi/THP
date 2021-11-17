//
//  ProductDetailViewController.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var selectedImage: String!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "PRODUCT DETAIL"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDeatilViewImage()
    }

    func loadDeatilViewImage() {
        DispatchQueue.main.async {
            
            let imageURL = NSURL(string: "https://riverisland.scene7.com/is/image/RiverIsland/" + self.selectedImage + "_main")
            let imageData = NSData(contentsOf: imageURL! as URL)
            
            DispatchQueue.main.async {
                
                if (imageData != nil) {
                    self.productImageView.image = UIImage(data: imageData! as Data)
                }
            }
            
        }
    }
}


