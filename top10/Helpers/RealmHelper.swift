//
//  RealmHelper.swift
//  top10
//
//  Created by Stefanie Seah on 31/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


class RealmHelper {
    static func addLocation(location: Location){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(location)
        }
    }

}