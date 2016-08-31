//
//  Location.swift
//  top10
//
//  Created by Stefanie Seah on 31/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation

class Location {
    var name: String = ""
    var woeid: Int
    
    init(name: String, woeid: Int){
        self.name = name
        self.woeid = woeid
    }
    
}