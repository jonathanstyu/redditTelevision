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
        let url = NSURL(string: URLFactory.createURL("week", subreddit: "videos"))
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        _ = session.dataTaskWithRequest(request) { (receivedData, urlResponse, receivedError) -> Void in
            completion(receivedData: receivedData, error: receivedError)
        }
    }
    
    class func createURL(time: String, subreddit: String) -> String {
        return "https://www.reddit.com/search.json?q=%28site%3Ayoutube.com+OR+site%3Avimeo.com+OR+site%3Ayoutu.be%29+nsfw%3A0+subreddit%3A\(subreddit)&restrict_sr=&sort=top&t=\(time)"
    }
}

extension Int {
    var days: NSTimeInterval {
        let DAY_IN_SECONDS = 60 * 60 * 24
        let days: Double = Double(DAY_IN_SECONDS) * Double(self)
        
        return days
    }
}