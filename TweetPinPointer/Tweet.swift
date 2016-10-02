//
//  Tweet.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import GoogleMaps

struct Tweet {
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var author: String!
    var text: String!
    var isPositive: Bool!
    var positivity: Float!
    var negativity: Float!
}
