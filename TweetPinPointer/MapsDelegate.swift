//
//  MapsDelegate.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import GoogleMaps

class MapsDelegate: UIViewController, GMSMapViewDelegate {

//    NOT NEED ANYMORE BECAUSE WE WILL NEVER HAVE INFO WINDOW
//    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
//        let customMarker: TweetInfoWindow = TweetInfoWindow.loadFromNib()
//        customMarker.text.text = marker.tweet.text
//        // change the image
//        // change the color of the text for neg/pos
//        return customMarker
//    }
    
//    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
//        print("tap tap")
//    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        
        
        return true
    }
}
