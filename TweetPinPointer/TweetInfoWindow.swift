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
        switch (isTrump, isPositive) {
        case (true, true):
            icon.image = UIImage(named: "TrumpHappy")
            text.textColor = .blue
        case (true, false):
            icon.image = UIImage(named: "TrumpSad")
            text.textColor = .red
        case (false, true):
            icon.image = UIImage(named: "ClintonHappy")
            text.textColor = .blue
        case (false, false):
            icon.image = UIImage(named: "ClintonSad")
            text.textColor = .red
        }
    }
}
