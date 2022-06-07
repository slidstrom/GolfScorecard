//
//  MapViewController.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/7/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            print("Permission Granted")
            locationManager.startUpdatingLocation()
            let location = locationManager.location
            locationManager.stopUpdatingHeading()
        }
        else{
            print("Denied")
        }
    }
    
    

    
}
