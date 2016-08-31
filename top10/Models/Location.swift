//
//  Location.swift
//  top10
//
//  Created by Stefanie Seah on 31/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Location: Object {
    dynamic var name: String = ""
    dynamic var woeid: Int = 1
    
    convenience required init(name: String, woeid: Int){
        self.init()
        self.name = name
        self.woeid = woeid
    }
    
}