//
//  MenuVC-Coll.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import TVMLKit

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, TVApplicationControllerDelegate {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
//        let collBorder: CGFloat = 0.0
//        let collFrame = CGRectMake(collBorder, (self.view.frame.height - 2 * collBorder) * 0.4 + collBorder, (self.view.frame.width - 2 * collBorder), (self.view.frame.height - 2 * collBorder) * 0.6)
        let collFrame = self.view.frame
        
        menuCollection = UICollectionView(frame: collFrame, collectionViewLayout: layout)
        menuCollection.delegate = self
        menuCollection.dataSource = self
        menuCollection.registerClass(VidViewCell.self, forCellWithReuseIdentifier: "cell")
        menuCollection.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        menuCollection.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        self.view.addSubview(menuCollection)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(menuCollection.frame.width / 3.25, menuCollection.frame.height / 1.7)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = menuCollection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! VidViewCell
        let video = self.videos[indexPath.section][indexPath.row] as Video!
        
        cell.backgroundColor = UIColor.blackColor()
        cell.title.textColor = UIColor.whiteColor()
        cell.title.text = video.title
        cell.title.textAlignment = NSTextAlignment.Center
        if (video.image != nil) {
            cell.thumbnail.image = video.image
        } else if video.thumbnail_url != "" {
            URLFactory.downloadImageWithURL(video.thumbnail_url) { (succeeded, image) -> Void in
                if succeeded {
                    cell.thumbnail.image = image
                    video.image = image
                }
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let reusableView: UICollectionReusableView! = nil
        
        if kind == UICollectionElementKindSectionHeader {
//            var headerView: UICollectionReusableView! = nil
            let headerView = self.menuCollection.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", forIndexPath: indexPath)
            if headerView.subviews.count == 0 {
                let lab = UILabel()
                headerView.addSubview(lab)
                lab.frame = CGRect(x: 0, y: 0, width: menuCollection.frame.width, height: 100)
                lab.font = UIFont.boldSystemFontOfSize(45.0)
            }
            
            let lab = headerView.subviews[0] as! UILabel
            lab.text = channels[indexPath.section]
            
            return headerView
        }
        
        return reusableView
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(menuCollection.frame.width, 100)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.videos.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos[section].count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 45.0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let channelVC = ChannelViewController(channel: channels[indexPath.row])
        self.presentViewController(channelVC, animated: true, completion: nil)
        
    }
    
    func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        print("Hello!!! \(channels[indexPath.row])")
        return true
    }
}