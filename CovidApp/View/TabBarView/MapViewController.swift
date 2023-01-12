//
//  MapViewController.swift
//  CovidApp
//
//  Created by Tunahan on 12/8/22.
//

import MapKit
import UIKit
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
   
    
    let map = MKMapView()
    var location:[Location] = []
    var data: [CitysData] = [ ]
    var coordinate = CLLocationCoordinate2D()
    
    
    
   // let coordinate2 = CLLocationCoordinate2D(latitude: 12331, longitude: 21324 )
    // let coordinate2 = CLLocationCoordinate2D(latitude: self.location[0].latitudeDelta, longitude: self.location[0].longitude )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(location)
        coordinate = CLLocationCoordinate2D(latitude: location[0].latitudeDelta, longitude:location[0].longitude )
        
        view.addSubview(map)
        map.frame = view.bounds
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                         span: MKCoordinateSpan(latitudeDelta: 0.2,
                                                                longitudeDelta: 0.2)), animated: true
        )
        
        addPin()
        map.delegate = self
        print(data)
    }
    
    private func addPin(){
        let pin = MKPointAnnotation()
        pin.title = data[0].name
        pin.subtitle = "Toplam Vaka: \(data[0].numberOfPatients!) - Toplam İyileşen: \(data[0].numberOfRecoveredPatients!) - Toplam Ölüm :\(data[0].numberOfDeath!) "
        pin.coordinate = coordinate
        map.addAnnotation(pin)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "country")
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "country")
            annotationView?.canShowCallout = true
            annotationView?.leftCalloutAccessoryView
            
        }else {
            annotationView?.annotation=annotation
        }
        annotationView?.image = UIImage(named: "icon")
        return annotationView
    }
    
       
}
