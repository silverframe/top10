//
//  TrendingTopic.swift
//  top10
//
//  Created by Stefanie Seah on 30/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation

class TrendingTopic {
    var tweetVolume: Int? 
    var name: String
    
    init(name: String, tweetVolume: Int?){
        self.name = name
        self.tweetVolume = tweetVolume
    }
    
}