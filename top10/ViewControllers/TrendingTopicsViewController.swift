//
//  TrendingTopicsViewController.swift
//  top10
//
//  Created by Stefanie Seah on 30/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import UIKit
import OAuthSwift

class TrendingTopicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TrendingTopicDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trendingTopics:[TrendingTopic] = [TrendingTopic]()
    var selectedTopic: TrendingTopic?
    let model: TrendingTopicModel = TrendingTopicModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.delegate = self 
        model.getTrendingTopics()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK: - Trending Topic Delegate Methods
    
    func dataReady() {
        self.trendingTopics = self.model.trendingTopicArray
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 55.0
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return trendingTopics.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
        let rank = (indexPath.row + 1)
        let name = trendingTopics[indexPath.row].name
        let tweetVolume = trendingTopics[indexPath.row].tweetVolume
        
        let trendingTopicRankLabel = cell.viewWithTag(3) as! UILabel
        trendingTopicRankLabel.text = String(rank)
        
        let trendingTopicNameLabel = cell.viewWithTag(1) as! UILabel
        trendingTopicNameLabel.text = name
        
        let trendingTopicTweetVolume = cell.viewWithTag(2) as! UILabel
        if let cellTweetVolume =  tweetVolume {
            trendingTopicTweetVolume.text = String("\(cellTweetVolume) Tweets") }

        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
}