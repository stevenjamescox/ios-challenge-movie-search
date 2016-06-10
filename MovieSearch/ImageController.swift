//
//  ImageController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ImageController {
    
    //full URL for my sanity: http://image.tmdb.org/t/p/w500/ (plus the "poster_image_path" from the main API)
    
    static let posterImageBaseURL = NSURL(string: "http://image.tmdb.org/t/p/w500/")
    
    static func fetchImage(url: NSURL, completion: (image: UIImage?) -> Void) {
        
        NetworkController.performReq(url, httpMethod: .Get) { (data, error) in
            
            if let data = data {
                let image = UIImage(data: data)
                completion (image: image)
            }
        }
    }
}