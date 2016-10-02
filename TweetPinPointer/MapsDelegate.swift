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
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let customMarker: TweetInfoWindow = TweetInfoWindow.loadFromNib()
        customMarker.text.text = marker.title
        print("here")
        return customMarker
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("tap tap")
    }
    
}
