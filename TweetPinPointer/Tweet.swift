//
//  Tweet.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import GoogleMaps
import SwiftyJSON

struct Tweet {
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var author: String!
    var text: String!
    var isPositive: Bool!
    var positivity: Float!
    var negativity: Float!
    var isTrump: Bool!
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, author: String, text: String,
         isPositive: Bool, positivity: Float, negativity: Float, isTrump: Bool) {
        self.latitude = latitude
        self.longitude = longitude
        self.author = author
        self.text = text
        self.isPositive = isPositive
        self.positivity = positivity
        self.negativity = negativity
        self.isTrump = isTrump
    }
    
    init(fromJson json: JSON) {
        latitude = json["lat"].doubleValue
        longitude = json["lng"].doubleValue
        author = json["user"].stringValue
        text = json["text"].stringValue
        
        let sentiment = json["sentiment"].stringValue
        isPositive = sentiment == "pos"
        
        let candidate = json["subject"].stringValue
        isTrump = candidate == "Donald Trump"
    }
    
    enum Candidate {
        case trump
        case hillary
    }
}
