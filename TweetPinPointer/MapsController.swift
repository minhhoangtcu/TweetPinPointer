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
    var mapView: GMSMapView!
    
    var markerCreator: MarkerCreator = MarkerCreator()
    var mapsDelegate: MapsDelegate = MapsDelegate()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (userLati == nil && userLong == nil) {
            determineMyCurrentLocation()
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.ImageNames.InfoButton),
                                                            style: .plain,
                                                            target: self, action: #selector(infoButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGray
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
        /*
         Zoom Level:
         1: World
         5: Landmass/continent
         10: City
         15: Streets
         20: Buildings
        */
        let camera = GMSCameraPosition.camera(withLatitude: userLati, longitude: userLong, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.setMinZoom(7, maxZoom: 20)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        view = mapView
        
        TweetDataSource.loadTweets(lat: userLati, lng: userLong) {(tweets: [Tweet]) in
            self.markerCreator.mapView = mapView
            for tweet in tweets {, lat: self.userLati, lng: self.userLong
                self.markerCreator.createMaker(withTweet: tweet)
            }
        }
    }
    
    
    // MARK: Find radius of current zoom level
    
    func getTopCenterCoordinate() -> CLLocationCoordinate2D {
        // to get coordinate from CGPoint of your map
        let topCenterCoor = mapView.convert(CGPoint(x: mapView.frame.size.width / 2.0, y: 0), from: mapView)
        let point = mapView.projection.coordinate(for: topCenterCoor)
        return point
    }
    
    func getRadius(centerLocation :CLLocation) -> CLLocationDistance {
        let topCenterCoordinate = getTopCenterCoordinate()
        let topCenterLocation = CLLocation(latitude: topCenterCoordinate.latitude, longitude: topCenterCoordinate.longitude)
        let radius = CLLocationDistance(centerLocation.distance(from: topCenterLocation))
        return round(radius)
    }
    
    // MARK: MAP DELEGATE
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let centerLocation = CLLocation(latitude: position.target.latitude, longitude: position.target.longitude)
        let radius = getRadius(centerLocation: centerLocation)
        print("lati: \t\(position.target.latitude) \tlong: \t\(position.target.longitude) \tradius: \(radius) (m)")
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        performSegue(withIdentifier: Constants.SegueIdentifiers.ToInfo, sender: marker)
        return true
    }
    
    func infoButtonPressed() {
        performSegue(withIdentifier: Constants.SegueIdentifiers.ToAbout, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indentifier = segue.identifier {
            switch (indentifier) {
            case Constants.SegueIdentifiers.ToInfo:
                let marker = sender as! GMSMarker
                let infoController = segue.destination as! InfoController
                infoController.tweet = marker.tweet
            case Constants.SegueIdentifiers.ToAbout:
                break // do nothing. really.
            default:
            break
            }
        }
    }
}
