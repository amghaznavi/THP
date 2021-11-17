//
//  HomeViewController.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = goButton.frame.width / 2
        goButton.layer.masksToBounds = true
    }
}
