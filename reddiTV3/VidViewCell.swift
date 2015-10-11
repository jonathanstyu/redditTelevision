//
//  VidViewCell.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

class VidViewCell: UICollectionViewCell {
    var thumbnail: UIImageView!
    var title: UILabel!
    var video: Video!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let border: CGFloat = 10
        let thumbnailFrame: CGRect = CGRectMake(border, border, (self.contentView.frame.width - 2 * border), (self.contentView.frame.height - 2 * border)*0.67)
        thumbnail = UIImageView()
        thumbnail.adjustsImageWhenAncestorFocused = true
        thumbnail.backgroundColor = UIColor.whiteColor()
        thumbnail.image = UIImage(named: "DefaultVidThumbnail")
        thumbnail.frame = thumbnailFrame
        
        title = UILabel()
        title.adjustsFontSizeToFitWidth = true
//        title.font = UIFont(name: "Avenir-Black", size: 30.0)
        title.minimumScaleFactor = 0.1
        title.frame = CGRectMake(0, thumbnail.frame.height, self.contentView.frame.width, self.contentView.frame.height - thumbnail.frame.height)
        
        self.contentView.addSubview(thumbnail)
        self.contentView.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
}
