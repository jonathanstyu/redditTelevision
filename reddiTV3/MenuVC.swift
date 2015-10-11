//
//  ViewController.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var menuCollection: UICollectionView!
    var videos: [String:[Video]] = [String:[Video]]()
    var channels: [String] = ["videos", "music", "gaming", "funny"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
        URLFactory.populateVideos(self.channels) { (downloadedVideos) -> Void in
            self.videos = downloadedVideos
            self.menuCollection.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

