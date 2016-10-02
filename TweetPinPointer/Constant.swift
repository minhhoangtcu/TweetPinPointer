//
//  Constant.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation

struct Constants {
    
    struct APIKeys {
        static let GoogleMapsAPIKey = "AIzaSyCNoUYL9Wm4L9SQkpuAJaKXSYLtHhAbLXc"
    }
    
    static let testTweet1 = Tweet(
        latitude: 30.6124366984386,
        longitude: -96.341572652461,
        author: "Minh Hoang",
        text: "To be or not to be! Foo bar!",
        isPositive: true,
        positivity: 51.0,
        negativity: 49.0,
        isTrump: true
    )
}
