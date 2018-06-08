//
//  LocationUtils.swift
//  Meetennis
//
//  Created by Hackintosh on 6/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import CoreLocation

class LocationUtils {
    
    static func getAddress(location: Location, onAddressReceive: @escaping (CLPlacemark) -> ()) {
        let location = CLLocation(latitude: location.latitude,
                                  longitude: location.longitude)
    
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            guard error == nil else {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
        
            guard let pm = placemarks else {
                print("Problem with the data received from geocoder")
                return
            }
            onAddressReceive(pm[0])
        })
    }
}
