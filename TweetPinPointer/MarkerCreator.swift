//
//  MarkerCreator.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import GoogleMaps

class MarkerCreator {
    
    var mapView: GMSMapView!
    
    func createMaker(withTweet tweet: Tweet) {
        let position = CLLocationCoordinate2DMake(tweet.latitude, tweet.longitude)
        let marker = GMSMarker(position: position)
        marker.tweet = tweet
        marker.map = mapView
    }
}
