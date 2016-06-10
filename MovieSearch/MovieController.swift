//
//  MovieController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let sharedController = MovieController()
    
    //combined URL for my sanity: https://api.themoviedb.org/3/search/movie?api_key=f83783c7c1e09d03fe09770bc9c4bf57&query= (then inquiry entered by user in searchbar)
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie") ?? NSURL()
    
    static let apiKey = "f83783c7c1e09d03fe09770bc9c4bf57"
    
    var movies: [Movie] = []
    
    static func fetchMovies(searchText: String, completion: (movies: [Movie]) -> Void) {
        
        let parameters: [String: String] =
            ["api_key":apiKey, "query":searchText.lowercaseString]
        
        NetworkController.performReq(baseURL, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            
            if error != nil {
                completion(movies: [])
            }
            
            guard let data = data,
                  let rawJSON = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                  let jsonDict = rawJSON as? JSON,
                  let result = jsonDict["results"] as? [JSON] else {
                    completion(movies: [])
                    return }
            let movies = result.flatMap({Movie(json: $0)})
            completion(movies: movies)
        }
        completion(movies: [])
    }
}