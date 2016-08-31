//
//  EditLocationViewController.swift
//  top10
//
//  Created by Stefanie Seah on 31/8/16.
//  Copyright © 2016 Stefanie Seah. All rights reserved.
//

import UIKit

class EditLocationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locations:[Location] = [Location]()
    var selectedLocation: Location?
    let model: LocationModel = LocationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.delegate = self
        model.getLocations()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - Location Delegate Methods
    
    func dataReady() {
        self.locations = self.model.locationArray
        self.tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 44.0
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return locations.count 
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell")!
        
        let name = locations[indexPath.row].name
        
        let LocationNameLabel = cell.viewWithTag(4) as! UILabel
        LocationNameLabel.text = String(name)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    @IBAction func unwindToTrendingTopicsViewController(segue: UIStoryboardSegue) {
        
        
    }
    

}