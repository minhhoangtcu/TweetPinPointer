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
    
    func createMaker(withTweet tweets: [Tweet]) {
        
        let icon = UIImage(named: Constants.ImageNames.Marker)!
        let customMarker: TweetInfoWindow = TweetInfoWindow.loadFromNib()
        
        // Create container
        let annotationImage = UIView.init(frame: CGRect(x: 0, y: 0, width: customMarker.frame.size.width, height: customMarker.frame.size.height + icon.size.height))
        
        // Create icon view and center
        let iconImageView = UIImageView(image: icon)
        iconImageView.backgroundColor = .clear
        iconImageView.frame = CGRect(x: (customMarker.frame.size.width - icon.size.width)/2, y: customMarker.frame.size.height, width: icon.size.width, height: icon.size.height)
        
        for tweet in tweets {
            let position = CLLocationCoordinate2DMake(tweet.latitude, tweet.longitude)
            let marker = GMSMarker(position: position)
            
            customMarker.text.text = tweet.text
            customMarker.changeInterface(isTrump: tweet.isTrump, isPositive: tweet.isPositive)
            marker.tweet = tweet
            marker.map = mapView
            annotationImage.addSubview(customMarker)
            annotationImage.addSubview(iconImageView)

            // Render image
            var renderedIcon: UIImage?
            
            UIGraphicsBeginImageContextWithOptions(annotationImage.frame.size, false, UIScreen.main.scale)
            if let ctx = UIGraphicsGetCurrentContext() {
                annotationImage.layer.render(in: ctx)
                renderedIcon = UIGraphicsGetImageFromCurrentImageContext()
            }
            if renderedIcon != nil {
                marker.icon = renderedIcon
            }
            
        }
    }
}
