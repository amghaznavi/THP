//
//  TabBarController.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import UIKit

class TabBarController: UITabBarController {

    @IBInspectable var initialIndex: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
    }
}

