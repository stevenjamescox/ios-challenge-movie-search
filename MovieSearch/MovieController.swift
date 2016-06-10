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
    
    //combined URL for my sanity:  https://api.themoviedb.org/3/search/movie?api_key=f83783c7c1e09d03fe09770bc9c4bf57&query= (then the inquiry entered by the user)
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie") ?? NSURL()
    
    static let apiKey = "f83783c7c1e09d03fe09770bc9c4bf57"


}