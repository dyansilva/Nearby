//
//  PlaceAnnotation.swift
//  Nearby
//
//  Created by Dyan silva on 12/12/24.
//

import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(place: Place) {
        self.title = place.name
        self.subtitle = place.description
        self.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
    }
}
