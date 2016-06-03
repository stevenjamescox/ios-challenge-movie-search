//
//  MovieController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {

    typealias JSON = [String: AnyObject]
    
    static let sharedController = MovieController()
    
    static let keyResults = "results"
    
    let baseUrl = NSURL(string: "https://api.themoviedb.org/3/movie/")
    
    static let keyForAPI = "?api_key=f83783c7c1e09d03fe09770bc9c4bf57"
    
    var movies: [Movie] = []
    
    func getMovies(completion: (movies: [Movie]) -> Void ) {
        guard let unwrappedURL = baseUrl else {
        return }
        
    NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get) { (data, error) in
        guard let data = data,
        jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)),
        resultsArray = jsonDictionary[keyResults] as? [JSON]
            else {
                completion(movies: [])
                return
        }
        let moviesArray = resultsArray.flatMap({Movie(jsonDictionary:$0)})
        completion(movies: moviesArray)
        }
    }
}
