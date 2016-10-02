//
//  GMSMarkerExtension.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import GoogleMaps

var storedTweet: Tweet!

// To hold more data
extension GMSMarker {
    
    var tweet: Tweet {
        get {
            return storedTweet
        }
        set {
            storedTweet = newValue
        }
    }
    
}
