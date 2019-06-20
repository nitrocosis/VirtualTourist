//
//  MapVC.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/25/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class MapVC: UIViewController {
    
    var dataController: DataController!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var pins: [Pin]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        longPress()
        setupLastViewedMapRegion()
        loadPins()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoAlbumVC" {
            if let controller = segue.destination as? PhotoAlbumVC,
                let annotation = sender as? Pin {
                controller.pin = annotation
                controller.dataController = dataController
            }
        }
    }
    
    func longPress() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(dropPin(_:)))
        mapView.addGestureRecognizer(longPress)
    }
    
    func setupLastViewedMapRegion() {
        if let lastViewedMapRegion = UserPreferences.lastViewedMapRegion {
            mapView.setRegion(lastViewedMapRegion, animated: true)
        }
    }
    
    @objc func dropPin(_ sender: UIGestureRecognizer) {
        if sender.state == .began {
            let point = sender.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            let pin = Pin(context: dataController.viewContext)
            pin.latitude = coordinate.latitude
            pin.longitude = coordinate.longitude
            try? dataController.viewContext.save()
            mapView.addAnnotation(pin)
        }
    }
    
    func loadPins() {
        let pinRequest: NSFetchRequest<Pin> = Pin.fetchRequest()
        
        if let result = try? dataController.viewContext.fetch(pinRequest) {
            pins = result
            mapView.addAnnotations(result)
        }
    }
    
    func updateLastViewedMapRegion(_ region: MKCoordinateRegion) {
        UserPreferences.lastViewedMapRegion = region
    }
}

extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        updateLastViewedMapRegion(mapView.region)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let pin = view.annotation as? Pin {
            performSegue(withIdentifier: "PhotoAlbumVC", sender: pin)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.pinTintColor = .red
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
}
