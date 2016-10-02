//
//  TweetDataSource.swift
//  TweetPinPointer
//
//  Created by Alan Wernick on 10/2/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import Foundation
import GoogleMaps
import Alamofire
import SwiftyJSON

class TweetDataSource {
    class func loadJSONData(url: String, params: [String: String], success: @escaping (_ json:JSON) -> Void, error: @escaping () -> Void ) {
        Alamofire.request(url)
            .responseJSON { response in
                guard response.result.isSuccess == true else {
                    error()
                    return
                }
                
                let json = JSON(data: response.data!)
                success(json)
        }
    }

    // MARK: - Tweets
    
    class func loadTweets(lat: CLLocationDegrees, lng: CLLocationDegrees, radius: CLLocationDistance, completion: @escaping ([Tweet]) -> Void) {
        var requestUrl = "\(Constants.API_URL)/"
        requestUrl += "tweets"
        
        // Temporary. Just need to test the method.
        //let radius = 100
        
        loadJSONData(url: requestUrl,
                     params: [
                        "lat": "\(lat)",
                        "lng": "\(lng)",
                        "radius": "\(radius)"
                     ],
                     success: { json in
                        var tweets: [Tweet] = []
                        
                        for item in json.arrayValue {
                            // Build Tweet
                            let tweet = Tweet(fromJson: item)
                            tweets.append(tweet)
                        }
                        
                        completion(tweets)
            },
                     
                     error: {
                        print("error")
            }
        )
    }
}
