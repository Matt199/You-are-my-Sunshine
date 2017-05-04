//
//  MapViewController.swift
//  Space App
//
//  Created by Mateusz Kopacz on 27.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class MapViewController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    
    var artworks = [Charger]()
    
    var tab = [Double]()
    var tab2 = [Double]()
    var dataArray:NSArray = []
    var dataArray2:NSArray = []
    var array2d = [[Double]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        parseJson()
        
        array2d = [tab,tab2]
        print(array2d)
        
        
        let location = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        centerMapLocation(location: location)
        
        for i in 0..<tab.count {
            
            artworks.append(Charger(title: "Charging hub", locationName: "",  coordinate: CLLocationCoordinate2D(latitude: tab[i], longitude: tab2[i] ), image: UIImage(named: "panels.png")!))
            
        }
        
        mapView.addAnnotations(artworks)
        
        
    }
    
    
    func centerMapLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    func parseJson() {
        
        let url = Bundle.main.url(forResource: "AdresData", withExtension: "json")
        
        let data = try? Data(contentsOf: url!)
        
        let JSON = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
        
        //print(JSON)
        
        if let hub1 = JSON["coordinates"] as? NSDictionary {
            
            
            if let lon = hub1["lat"], let lang = hub1["long"] {
                
                dataArray = lon as! NSArray
                dataArray2 = lang as! NSArray
                
                for i in dataArray {
                    
                    tab.append(i as! Double)
                    
                }
                
                for i in dataArray2 {
                    tab2.append(i as! Double)
                }
                
                
            }
            
        }
        
        
        
    }


}
