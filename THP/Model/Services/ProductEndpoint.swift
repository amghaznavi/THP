//
//  ProductEndpoint.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import Foundation

enum ProductEndpoint: Endpoint {
    case getSearchResults(searchText: String)
    var scheme: String {
        switch self  {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "static-ri.ristack-3.nn4maws.net"
        }
    }
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "/v1/plp/en_gb/2506/products.json"
        }
    }
    
    var parameters: [URLQueryItem] {
        let apiKey = ""
        
        switch self {
        case .getSearchResults(let searchText):
            return [
                
                    URLQueryItem(name: "text", value: searchText),
                    URLQueryItem(name: "api_key", value: apiKey)
            ]
        }
    }
    
    var method: String{
        switch self {
        case .getSearchResults:
            return "GET"
        }
    }

}
