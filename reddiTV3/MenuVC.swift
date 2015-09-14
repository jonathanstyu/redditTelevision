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
    var channels = ["videos", "music", "television", "gaming", "sports", "documentaries", "redditpicks", "funny", "classicalmusic", "jazz", "sciencevideos", "learnuselesstalents", "deepintoyoutube", "todayilearned"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

