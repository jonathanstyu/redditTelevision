//
//  ChannelVC.swift
//  reddiTV3
//
//  Created by Jonathan Yu on 9/22/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

class ChannelViewController: UIViewController {
    var channel: String!
    
    init(channel: String) {
        super.init(nibName: nil, bundle: nil)
        self.channel = channel
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        let titleFrame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let titleLabel = UILabel(frame: titleFrame)
        titleLabel.text = self.channel
        self.view.addSubview(titleLabel)
    }
    
}