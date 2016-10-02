//
//  InfoController.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/2/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import UIKit

class InfoController:  UIViewController {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var positivityLabel: UILabel!
    @IBOutlet weak var negativityLabel: UILabel!
    
    @IBOutlet weak var borderTop: UIView!
    @IBOutlet weak var borderDown: UIView!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        // Border not showing?
        borderTop.addBottomBorderWithColor(color: .black, width: 10.0)
        borderDown.addBottomBorderWithColor(color: .black, width: 10.0)
        
        icon.image = getImage(isTrump: tweet.isTrump, isPositive: tweet.isPositive)
        authorLabel.text = tweet.author
        dateLabel.text = tweet.date
        text.text = tweet.text
        if (tweet.positivity != nil) { positivityLabel.text = String(tweet.positivity) }
        if (tweet.negativity != nil) { negativityLabel.text = String(tweet.negativity) }
    }
    
}
