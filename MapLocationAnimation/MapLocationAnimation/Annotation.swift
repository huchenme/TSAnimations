//
//  Annotation.swift
//  MapLocationAnimation
//
//  Created by Hu Chen on 10/5/16.
//  Copyright © 2016 Hu Chen. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coodinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coodinate
        self.title = title
        self.subtitle = subtitle
    }
}
