//
//  TrendingTopicModel.swift
//  top10
//
//  Created by Stefanie Seah on 30/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import Foundation
import Alamofire

protocol TrendingTopicDelegate {
    
    func dataReady()
}

class TrendingTopicModel: NSObject {
    
    var trendingTopicArray = [TrendingTopic]()
    
    var delegate: TrendingTopicDelegate?
    
    var number = 1
    
    func getTrendingTopics(params: [String: Int]){
        Alamofire.request(.GET, "https://top10-server.herokuapp.com/", parameters: params ).responseJSON{(response) in
            if let JSON = response.result.value {
                var arrayOfTrendingTopics = [TrendingTopic]()
                if let trendingTopics = JSON["trends"] as? NSArray {
                    let count = 9
                    for i in 0...count {
                        let trendingTopicName = trendingTopics[i].valueForKeyPath("name") as! String
                        if let trendingTopicTweetVolume = trendingTopics[i].valueForKeyPath("tweet_volume") as? Int {
                            let trendingTopicObj = TrendingTopic(name: trendingTopicName, tweetVolume: trendingTopicTweetVolume)
                            arrayOfTrendingTopics.append(trendingTopicObj)
                        } else {
                            let trendingTopicObj = TrendingTopic(name: trendingTopicName, tweetVolume: nil)
                            arrayOfTrendingTopics.append(trendingTopicObj)
                        }
                    }
                }
                self.trendingTopicArray = arrayOfTrendingTopics
                if let delegate = self.delegate {
                    delegate.dataReady()
                }
            }
        }
    }
}
