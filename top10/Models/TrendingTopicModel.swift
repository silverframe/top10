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
    
    func getTrendingTopics(){
        Alamofire.request(.GET, "http://localhost:3000").responseJSON{(response) in
            
            if let JSON = response.result.value {

                var arrayOfTrendingTopics = [TrendingTopic]()
                
                if let trendingTopics = JSON as? NSArray {
                    for trendingTopic in trendingTopics {
//                        print("hello: \(trendingTopic)")
                        let trendingTopicName = trendingTopic.valueForKeyPath("name") as! String
                        if let trendingTopicTweetVolume = trendingTopic.valueForKeyPath("tweet_volume") as? Int {
                            let trendingTopicObj = TrendingTopic(name: trendingTopicName, tweetVolume: trendingTopicTweetVolume)
                            arrayOfTrendingTopics.append(trendingTopicObj)
                        } else {
                            let trendingTopicObj = TrendingTopic(name: trendingTopicName, tweetVolume: nil)
                            arrayOfTrendingTopics.append(trendingTopicObj)
                        }
                    }
                }

                self.trendingTopicArray = arrayOfTrendingTopics
                print(arrayOfTrendingTopics.count)
                
                if let delegate = self.delegate {
                    delegate.dataReady()
                }
            }
        }
    }
}