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
    
    // CLLocationDegrees is basically Double
    func createMarker(onMap mapView: GMSMapView, latitude lati: CLLocationDegrees, longitude long: CLLocationDegrees) {
        let position = CLLocationCoordinate2DMake(lati, long)
        let marker = GMSMarker(position: position)
        marker.title = "Hello World"
        marker.map = mapView
    }
    
    func createMaker(onMap mapView: GMSMapView, withTweet tweet: Tweet) {
        // do stuff
    }
    
}
