//
//  TrendingTopicsViewController.swift
//  top10
//
//  Created by Stefanie Seah on 30/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import UIKit


class TrendingTopicsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TrendingTopicDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trendingTopics:[TrendingTopic] = [TrendingTopic]()
    
    let model: TrendingTopicModel = TrendingTopicModel()
    
    var selectedLocation: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.delegate = self 
        model.getTrendingTopics(["id": 1])
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        if let location = self.selectedLocation {
            let params: [String: Int] = ["id": location.woeid]
            model.getTrendingTopics(params)
            self.title = location.name
        }
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
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
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
    
    @IBAction func unwindToTrendingTopicsViewController(segue: UIStoryboardSegue) {
        
        
    }
    
    
}