//
//  LocationModel.swift
//  top10
//
//  Created by Stefanie Seah on 31/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation
import Alamofire

protocol LocationDelegate {
    
    func dataReady()
}

class LocationModel: NSObject {
    
    var locationArray = [Location]()
    
    var delegate: LocationDelegate?
    
    func getLocations(){
        Alamofire.request(.GET, "https://top10-server.herokuapp.com/locations").responseJSON{(response) in
            
            if let JSON = response.result.value {
                
                var arrayOfLocations = [Location]()
                
                if let locations = JSON as? NSArray {
                    for location in locations {
                        let locationName = location.valueForKeyPath("name") as! String
                        let locationWoeid = location.valueForKeyPath("woeid") as! Int
                        let locationObj = Location(name: locationName, woeid: locationWoeid)
                        arrayOfLocations.append(locationObj)
                    
                        }
                    }
                self.locationArray = arrayOfLocations
                }
            if let delegate = self.delegate {
                delegate.dataReady()
            }
        }
    }
}

extension LocationModel {
    
    func saveLocationArray(){
        
//        if !NSUserDefaults.standardUserDefaults().boolForKey("HasLaunchedOnce") != true {
        Alamofire.request(.GET, "http://localhost:3000/locations").responseJSON{(response) in
            
            if let JSON = response.result.value {
                if let locations = JSON as? NSArray {
                    for location in locations {
                        let locationName = location.valueForKeyPath("name") as! String
                        let locationWoeid = location.valueForKeyPath("woeid") as! Int
                        let newLocation = Location(name: locationName, woeid: locationWoeid)
                        RealmHelper.addLocation(newLocation)
                            }
                        }
                    }
                }
            if let delegate = self.delegate {
                delegate.dataReady()
            }
//        }
//        locationArraySaved()
    }
    
    func locationArraySaved(){
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasLaunchedOnce")
    }
}
