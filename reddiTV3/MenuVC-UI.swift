//
//  MenuVC-UI.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/13/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

extension MenuViewController {
    
    func createUI() {
        self.view.backgroundColor = UIFactory.generateRandomColor()
        
        UIView.animateWithDuration(4.0, delay: 5.0, options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: { () -> Void in
            self.view.backgroundColor = UIFactory.generateRandomColor()
            }, completion: nil)
        
        setupCollectionView()
    }
    
}