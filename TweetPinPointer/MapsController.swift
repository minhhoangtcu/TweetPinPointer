//
//  ViewController.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var locationManager:CLLocationManager!
    var userLati: CLLocationDegrees!
    var userLong: CLLocationDegrees!
    
    var markerCreator: MarkerCreator!
    var mapsDelegate: MapsDelegate!
    
    override func viewDidLoad() {
        if (userLati != nil && userLong != nil) {
            loadMapWithCurrentLocation()
        }
        markerCreator = MarkerCreator()
        mapsDelegate = MapsDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
    // MARK: Determine current location once.

    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        manager.stopUpdatingLocation()
        
        userLati = userLocation.coordinate.latitude
        userLong = userLocation.coordinate.longitude
        loadMapWithCurrentLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    func loadMapWithCurrentLocation() {
        let camera = GMSCameraPosition.camera(withLatitude: userLati, longitude: userLong, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        view = mapView
        markerCreator.mapView = mapView
        markerCreator.createMaker(withTweet: Constants.testTweet1)
        markerCreator.createMaker(withTweet: Constants.testTweet2)
        markerCreator.createMaker(withTweet: Constants.testTweet3)
        markerCreator.createMaker(withTweet: Constants.testTweet4)
    }
    
    
    // MARK: MAP DELEGATE
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        performSegue(withIdentifier: Constants.SegueIdentifiers.ToInfo, sender: marker)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indentifier = segue.identifier {
            switch (indentifier) {
            case Constants.SegueIdentifiers.ToInfo:
                let marker = sender as! GMSMarker
                let infoController = segue.destination as! InfoController
                infoController.tweet = marker.tweet
            default:
            break
            }
        }
    }
}
