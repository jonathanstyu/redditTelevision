//
//  MenuVC-Coll.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        menuCollection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        menuCollection.delegate = self
        menuCollection.dataSource = self
        menuCollection.registerClass(VidViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(menuCollection)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(100, 100)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = menuCollection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! VidViewCell
        cell.backgroundColor = UIColor.blueColor()
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}