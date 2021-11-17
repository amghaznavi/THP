//
//  ProductResponse.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Products]

    enum CodingKeys: String, CodingKey {
        case products = "Products"
    }
}

struct Products: Codable {
    let prodid: String
    let name: String
    let cost: String
}


/* - URL

 
let url = URL(string: "https://static-ri.ristack-3.nn4maws.net/v1/plp/en_gb/2506/products.json")

 
*/

/* - TakeHomeProject Instructions
 
 iOS Task:
 
 Create an iOS application (ideally in Swift) with the following actions/functions
 
 Start-up screen
 
 Main Menu page that has a button to progress to a list of products
 The list of products will be generated from the JSON content (see link below) which should be loaded from:
 
 https://static-ri.ristack-3.nn4maws.net/v1/plp/en_gb/2506/products.json
 
 It should be a list view showing Name, Image and Price
 Image can be generated using the URL structure below
 The list of items is fairly large so only load images as they are visible
 You should be able to tap on a product and go to another page showing the image (large)
 
 You can get the images by using the following URL and substituting the prodid from the above plist.
 
 http://riverisland.scene7.com/is/image/RiverIsland/691807_main
 http://riverisland.scene7.com/is/image/RiverIsland/691807_main
 
 http://riverisland.scene7.com/is/image/RiverIsland/<prodid>_main
 
 The rest of the app is at your discretion in terms of design, look and feel and features. We would just ask that you avoid using SwiftUI as we don’t yet have this in many of our projects.
 
 This is content from one of our customers River Island so you can refer to their website for ideas and feel.
 
 However, we would recommend looking at some of our apps in the app store for example Selfridges and River Island.
 
 
 */




