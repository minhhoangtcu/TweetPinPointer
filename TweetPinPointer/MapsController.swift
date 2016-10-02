//
//  ViewController.swift
//  TweetPinPointer
//
//  Created by Minh Hoang on 10/1/16.
//  Copyright © 2016 Minh Hoang. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var locationManager:CLLocationManager!
    var userLati: CLLocationDegrees!
    var userLong: CLLocationDegrees!
    var markerCreator: MarkerCreator!
    
    override func viewDidLoad() {
        if (userLati != nil && userLong != nil) {
            loadMapWithCurrentLocation()
        }
        markerCreator = MarkerCreator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
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
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    func loadMapWithCurrentLocation() {
        let camera = GMSCameraPosition.camera(withLatitude: userLati, longitude: userLong, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // create marker here
        markerCreator.createMarker(onMap: mapView, latitude: userLati, longitude: userLong)
    }
    
}
