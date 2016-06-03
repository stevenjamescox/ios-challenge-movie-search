//
//  ImageController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import Foundation

class ImageController {
    
    static let baseURL = "https://image.tmdb.org/t/p/w500"
    
    static func imageForUrl(urlString: String, completion: (image: UIImage?) -> Void) {
        let imageURLString = ImageController.baseURL + imageForUrl
        guard let url = NSURL(string: urlString) else {
            NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
                guard let data = data else {
                completion(image: nil)
                    return
                }
                dispatch_async(dispatch_get_main_queue(), {
                    completion(image: UIImage(data:data))
            })
        }
    }
}