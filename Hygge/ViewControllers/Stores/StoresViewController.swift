//
//  StoresViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 11.07.2022.
//

import UIKit
import CoreLocation
import MapKit

class StoresViewController: BaseViewController {
    
    
    @IBOutlet private weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchLocation()
        
    }
    
    private func fetchLocation(){
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
        }
    }

}

extension StoresViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        
        let annotation = MKPointAnnotation()
        
        guard let lastLocation = locations.last else{return}
        
        annotation.coordinate = lastLocation.coordinate
        
        mapView.addAnnotation(annotation)
        
    }
}
