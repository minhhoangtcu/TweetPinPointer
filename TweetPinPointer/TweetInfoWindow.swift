//
//  TweetInfoWindow.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import UIKit

class TweetInfoWindow: UIView {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var text: UILabel!
    
//    class func instanceFromNib() -> UIView {
//        return UINib(nibName: "InfoWindow", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
//    }
    
    func changeInterface(isTrump: Bool, isPositive: Bool) {
        icon.image = getImage(isTrump: isTrump, isPositive: isPositive)
        if isPositive {
            text.textColor = .blue
        } else {
            text.textColor = .red
        }
    }
}
