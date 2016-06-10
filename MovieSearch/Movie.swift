//
//  Movie.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

typealias JSON = [String: AnyObject]

struct Movie {
    
    private let kId = "id"
    private let kTitle = "original_title"
    private let kOverview = "overview"
    private let kAvg = "vote_average"
    private let kPosterPath = "poster_path"
    
    let identifier: Int
    let title: String
    let overview: String
    let voteAverage: Double
    let posterPathURL: NSURL
    
    init?(json: JSON) {
        
        guard let identifier = json[kId] as? Int,
              let title = json[kTitle] as? String,
              let overview = json[kOverview] as? String,
              let voteAverage = json[kAvg] as? Double,
              let posterPathURLStr = json[kPosterPath] as? String,
              let posterPathURL = NSURL(string:"http://image.tmdb.org/t/p/w500/\(posterPathURLStr)") else
            
            { return nil }
        
        self.identifier = identifier
        self.title = title
        self.overview = overview
        self.voteAverage = voteAverage
        self.posterPathURL = posterPathURL
    }
}