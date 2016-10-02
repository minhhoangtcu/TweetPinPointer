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
    
    struct SegueIdentifiers {
        static let ToInfo = "ShowInfo"
    }
    
    struct ImageNames {
        static let TrumpHappy = "TrumpHappy"
        static let TrumpSad = "TrumpSad"
        static let ClintonHappy = "ClintonHappy"
        static let ClintonSad = "ClintonSad"
        static let Marker = "Marker"
    }
    
    static let testTweet1 = Tweet(
        latitude: 30.6124366984386,
        longitude: -96.341572652461,
        author: "Minh Hoang",
        text: "Trump is going to deport me, which is good",
        isPositive: true,
        positivity: 51.0,
        negativity: 49.0,
        isTrump: true,
        date: "10/01/2016"
    )
    
    static let testTweet2 = Tweet(
        latitude: 30.607835,
        longitude: -96.340525,
        author: "Karan",
        text: "I love her so so so so so so soooooo much!1!1",
        isPositive: true,
        positivity: 100.0,
        negativity: 0.0,
        isTrump: false,
        date: "10/01/2016"
    )

    static let testTweet3 = Tweet(
        latitude: 30.610317,
        longitude: -96.348298,
        author: "Alan",
        text: "He has to come from Baylor",
        isPositive: false,
        positivity: 33.0,
        negativity: 67.0,
        isTrump: true,
        date: "10/01/2016"
    )

    static let testTweet4 = Tweet(
        latitude: 30.616020,
        longitude: -96.348087,
        author: "Poopdiepie",
        text: "Release the ********** emails!",
        isPositive: false,
        positivity: 20.0,
        negativity: 80.0,
        isTrump: false,
        date: "10/01/2016"
    )
}
