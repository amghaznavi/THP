//
//  UIImage+RemoteImage.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    @discardableResult 
    
    func loadImageFromURL(urlString: String, placeHolder: UIImage? = nil) -> URLSessionDataTask? {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        if let placeHolder = placeHolder {
            self.image = placeHolder
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let data = data, let downloadImage = UIImage(data: data) {
                    imageCache.setObject(downloadImage, forKey: NSString(string: urlString))
                    self.image = downloadImage
                }
            }
        }
        task.resume()
        return nil
    }
}


