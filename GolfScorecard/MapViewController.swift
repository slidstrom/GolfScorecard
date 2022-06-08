//
//  MapViewController.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/7/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    let locationManager = LocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        mapView.showsUserLocation = true
//        mapView.userTrackingMode = .follow
        
        setPinAndCenterLocation(CLLocationCoordinate2D(latitude: 0, longitude: 0), "world center", "test")
        
    }
    
    func setPinAndCenterLocation(_ location: CLLocationCoordinate2D, _ title: String, _ subtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
        
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: 300, longitudinalMeters: 300)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    

    
}
