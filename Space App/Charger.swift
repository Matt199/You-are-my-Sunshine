//
//  Artwork.swift
//  Geo Localization
//
//  Created by Space Apps Challenge  on 03.05.2017.
//  Copyright © 2017 Space Apps Challenge . All rights reserved.
//

import Foundation
import UIKit
import MapKit
import AddressBook


class Charger: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let image: UIImage
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, image: UIImage) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.image = image
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    
    func mapItem() -> MKMapItem {
        
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
        
        
    }
    
    
}
