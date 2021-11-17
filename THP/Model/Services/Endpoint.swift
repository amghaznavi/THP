//
//  Endpoint.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import Foundation


protocol Endpoint {
    
    // HTTP or HTTPS
    var scheme: String { get }
    
    // Example "api.apple.com"
    var baseURL: String { get }
    
    // "/services/rest/"
    var path: String { get }
    
    // [URLQueryItem(name: "api_key", value: API_KEY)]
    var parameters: [URLQueryItem] { get }
    
    // "GET"
    var method: String { get }
}
