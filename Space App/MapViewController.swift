//
//  MapViewController.swift
//  Space App
//
//  Created by Mateusz Kopacz on 27.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    var cl : CLLocationManager?
    

    @IBOutlet weak var mapView: MKMapView!
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString("524 Ct St, Brooklyn, NY 11231", completionHandler: { placemarks, Error in
            
            if Error != nil {
                print("Error")
                return
            }
            
            if let placemarks = placemarks {
                
                let placemark = placemarks[0]
                
                
                let annotation = MKPointAnnotation()
                
                annotation.title = "Solar hub"
                
                if let location = placemark.location {
                
                    annotation.coordinate = location.coordinate
                    
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
                
                
                
            
            }
            
            
            
        })
        
    
        // Do any additional setup after loading the view.
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        let identifier = "MyPin"
        
        
        if annotation.isKind(of: MKUserLocation.self) {
        
            return nil
        
        }
        
        
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotation != nil {
        
            annotationView = MKPinAnnotationView(annotation: annotationView as? MKAnnotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: "panels.png")
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        
        return annotationView

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
