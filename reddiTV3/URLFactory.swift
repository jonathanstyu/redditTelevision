//
//  URLFactory.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

class URLFactory {
    
    class func urlPull(requestedUrl: String, completion: (parsedJSON: [String: AnyObject]) -> Void) -> Void {
        let url = NSURL(string: requestedUrl)
        let session = NSURLSession.sharedSession()
        enum Error: ErrorType {
            case InvalidJSON
        }
        
        let task = session.dataTaskWithURL(url!) { (receivedData, urlResponse, receivedError) -> Void in
            do {
                guard let jsonObject = try NSJSONSerialization.JSONObjectWithData(receivedData!, options: NSJSONReadingOptions.MutableContainers) as? [String: AnyObject] else {
                    throw Error.InvalidJSON
                }
                completion(parsedJSON: jsonObject)
            } catch {
                print(Error.InvalidJSON)
            }
        }
        task.resume()
    }
    
    class func createURL(time: String, subreddit: String) -> String {
        return "https://www.reddit.com/search.json?q=%28site%3Ayoutube.com+OR+site%3Avimeo.com+OR+site%3Ayoutu.be%29+nsfw%3A0+subreddit%3A\(subreddit)&restrict_sr=&sort=top&t=day"
    }
    
    class func populateVideos(channels: [String], completion: (downloadedVideos: [String: [Video]]) -> Void) -> Void {
        var downloadedVideos = [String:[Video]]()
        var GlobalMainQueue: dispatch_queue_t {
            return dispatch_get_main_queue()
        }
        var GlobalUserInitiatedQueue: dispatch_queue_t {
            return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        }
        let downloadQueue = dispatch_group_create()
        
        for channel in channels {
            dispatch_group_enter(downloadQueue)
            let channelURL = URLFactory.createURL("day", subreddit: channel)
            urlPull(channelURL, completion: { (parsedJSON) -> Void in
                let videoObjects: [AnyObject] = (parsedJSON["data"]?["children"]) as! [AnyObject]
                var parsedVideoObjects: [Video] = []
                
                for object in videoObjects {
                    let vidObject = object["data"] as! [String: AnyObject]
                    let video = Video()
                    video.url = vidObject["url"] as! String
                    video.title = vidObject["title"] as! String
                    video.created = vidObject["created"] as! Int
                    video.num_comments = vidObject["num_comments"] as! Int
                    video.thumbnail_url = vidObject["thumbnail"] as! String
                    parsedVideoObjects.append(video)
                }
                downloadedVideos[channel] = parsedVideoObjects
                dispatch_group_leave(downloadQueue)
            })
        }
        
        dispatch_group_notify(downloadQueue, GlobalMainQueue) { () -> Void in
            completion(downloadedVideos: downloadedVideos)
        }
    }
    
    class func downloadImageWithURL(picUrl: String, completion: (succeeded: Bool, image: UIImage) -> Void) -> Void {
        let url = NSURL(string: picUrl)
        let session = NSURLSession.sharedSession()
        enum Error: ErrorType {
            case InvalidImage
        }
        
        let task = session.dataTaskWithURL(url!) { (receivedData, urlResponse, receivedError) -> Void in
            do {
                guard let receivedImage = UIImage(data: receivedData!) as UIImage! else {
                    throw Error.InvalidImage
                }
                completion(succeeded: true, image: receivedImage)
            } catch {
                print(Error.InvalidImage)
            }
        }
        task.resume()
    }
}

extension Int {
    var days: NSTimeInterval {
        let DAY_IN_SECONDS = 60 * 60 * 24
        let days: Double = Double(DAY_IN_SECONDS) * Double(self)
        
        return days
    }
}