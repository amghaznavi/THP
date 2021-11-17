//
//  NetworkManager.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import Foundation

class NetworkManager {
    
    /// Executes the web call and will decode the JSON response into the Codable object provided
    ///  - Parameters:
    ///  --- endpoint: the endpoint to make the HTTP request against
    ///  --- completion: the JSON response converted to the provided Codable object, if successful, or failure otherwise
    //1
    class func request<T: Codable>(endpoint: Endpoint, comletion: @escaping (Result<T, Error>) -> ()) {
        
        //2
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        //3
        guard let url = components.url else { return }
        
        //4
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        //5
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
        
            //6
            guard error == nil else {
            comletion(.failure(error!))
            print(error?.localizedDescription ?? "Unknown error")
            return
        }
        
        guard response != nil, let data = data else { return }
        
        DispatchQueue.main.async {
            if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                //7
                comletion(.success(responseObject))
            } else {
                let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedFailureErrorKey: "Failed to decode response"])
                comletion(.failure(error))
            }
        }
    }
        //8
        dataTask.resume()
        
    }
    
    
}
