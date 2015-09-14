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
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        let collBorder: CGFloat = 50.0
        let collFrame = CGRectMake(collBorder, (self.view.frame.height - 2 * collBorder) * 0.5, (self.view.frame.width - 2 * collBorder), (self.view.frame.height - 2 * collBorder) * 0.5)
        
        menuCollection = UICollectionView(frame: collFrame, collectionViewLayout: layout)
        menuCollection.delegate = self
        menuCollection.dataSource = self
        menuCollection.registerClass(VidViewCell.self, forCellWithReuseIdentifier: "cell")
        menuCollection.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(menuCollection)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(menuCollection.frame.width / 3.25, menuCollection.frame.height / 1.7)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = menuCollection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! VidViewCell
        
        cell.backgroundColor = UIColor.blackColor()
        cell.title.textColor = UIColor.whiteColor()
        cell.title.text = channels[indexPath.row]
        cell.title.textAlignment = NSTextAlignment.Center
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 45.0
    }
}