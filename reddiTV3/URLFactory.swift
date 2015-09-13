//
//  URLFactory.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation

class URLFactory {
    
    class func urlPull(completion: (receivedData: NSData?, error: NSError?) -> Void) -> Void {
        let url = NSURL(string: URLFactory.createURL(5))
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        _ = session.dataTaskWithRequest(request) { (receivedData, urlResponse, receivedError) -> Void in
            completion(receivedData: receivedData, error: receivedError)
        }
    }
    
    class func createURL(days: Int) -> String {
        let dateTime = NSDate().timeIntervalSince1970
        
        return "https://www.reddit.com/search.json?q=%28and+%28or+site%3A%27youtube.com%27+site%3A%27vimeo.com%27+site%3A%27youtu.be%27%29+timestamp%3A\(Int(dateTime - 5.days))..%29&restrict_sr=on&sort=top&syntax=cloudsearch"
    }
}

extension Int {
    var days: NSTimeInterval {
        let DAY_IN_SECONDS = 60 * 60 * 24
        let days: Double = Double(DAY_IN_SECONDS) * Double(self)
        
        return days
    }
}