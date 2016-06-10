//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

typealias STRINGDICT = [String: String]

class NetworkController {
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Delete = "DELETE"
        case Post = "POST"
        case Put = "PUT"
        case Patch = "PATCH"
    }
    
    static func performReq(url: NSURL, httpMethod: HTTPMethod, urlParameters: STRINGDICT? = nil, body: NSData? = nil, completion: ((data: NSData?, error: NSError?) -> Void)?) {
        
        let reqURL = urlFromParameters(url, urlParameters: urlParameters)
        
        let req = NSMutableURLRequest(URL: reqURL)
        req.HTTPMethod = httpMethod.rawValue
        req.HTTPBody = body
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(req) { (data, response, error) in
            if let completion = completion {
                completion(data: data, error: error)
            }
        }
        task.resume()
    }
    
    static func urlFromParameters(url: NSURL, urlParameters: STRINGDICT?) -> NSURL{
        
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urlParameters?.flatMap({NSURLQueryItem(name: $0.0, value: $0.1)})
        
        if let url = components?.URL {
            return url
        } else {
            fatalError("URL optional is nil ;'( ")
        }
    }
}