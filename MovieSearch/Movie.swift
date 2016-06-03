//
//  Movie.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Movie {
    
    typealias JSON = [String: AnyObject]
    
    private let keyTitle = "title"
    private let keyIdentifier = "id"
    private let keyAvgRating = "vote_average"
    private let keyDscpt = "overview"
    
    private let keyImagePathStr = "poster_path"
    
    var title: String
    var identifier: Int
    var avgRating: Double
    var dscpt: String
    
    var imagePathStr: String

    init?(jsonDictionary: JSON) {
    guard let identifier = jsonDictionary[keyIdentifier] as? Int else { return nil
    }
        self.identifier = identifier
        self.title = jsonDictionary[keyTitle] as? String ?? ""
        self.avgRating = jsonDictionary[keyAvgRating] as? Double ?? 0.0
        self.dscpt = jsonDictionary[keyDscpt] as? String ?? ""
    
        self.imagePathStr = jsonDictionary[keyImagePathStr] as? String ?? ""
    
}
}