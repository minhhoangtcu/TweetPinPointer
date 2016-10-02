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
        let customMarker: TweetInfoWindow = TweetInfoWindow.loadFromNib()
        customMarker.text.text = tweet.text
        // change the image
        // change the color of the text for neg/pos
        
        let icon = UIImage(named: "Marker")!
        
        // Create container
        let annotationImage = UIView.init(frame: CGRect(x: 0, y: 0, width: customMarker.frame.size.width, height: customMarker.frame.size.height + icon.size.height))
        annotationImage.addSubview(customMarker)

        // Create icon view and center
        let iconImageView = UIImageView(image: icon)
        iconImageView.backgroundColor = .clear
        iconImageView.frame = CGRect(x: (customMarker.frame.size.width - icon.size.width)/2, y: customMarker.frame.size.height, width: icon.size.width, height: icon.size.height)
        annotationImage.addSubview(iconImageView)
        
        // Render image
        UIGraphicsBeginImageContextWithOptions(annotationImage.frame.size, false, UIScreen.main.scale)
        if let ctx = UIGraphicsGetCurrentContext() {
            annotationImage.layer.render(in: ctx)
            marker.icon = UIGraphicsGetImageFromCurrentImageContext()
        }
    
        marker.tweet = tweet
        marker.map = mapView
    }
}
