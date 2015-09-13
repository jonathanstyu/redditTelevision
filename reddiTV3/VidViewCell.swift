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
    var vidThumbnail: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        vidThumbnail = UIImageView()
        vidThumbnail.image = UIImage(contentsOfFile: "DefaultVidThumbnail")
        vidThumbnail.frame = CGRectMake(20, 20, 100, 100)
        self.contentView.addSubview(vidThumbnail)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}
