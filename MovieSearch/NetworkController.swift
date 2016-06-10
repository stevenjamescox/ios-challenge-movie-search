//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Delete = "DELETE"
        case Post = "POST"
        case Put = "PUT"
        case Patch = "PATCH"
    }
    
    static func performReq(url: NSURL, httpMethod: HTTPMethod, urlParameters: [String: String]? = nil, body: NSData? = nil, completion: ((data: NSData?, error: NSError?) -> Void)?) {
        
        let reqURL = urlFromParameters(url, urlParameters: urlParameters)
        
        let req = NSMutableURLRequest(URL: reqURL)
        req.HTTPMethod = httpMethod.rawValue
        req.HTTPBody = body
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(req) { (data, response, error) in
            if let completion = completion {
                completion(data: data, error: error)
            }
        }
        dataTask.resume()
    }
    
    static func urlFromParameters(url: NSURL, urlParameters: [String: String]?) -> NSURL{
        
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urlParameters?.flatMap({NSURLQueryItem(name: $0.0, value: $0.1)})
        
        if let url = components?.URL {
            return url
        } else {
            fatalError("URL optional is nil ;'( ")
        }
    }
}