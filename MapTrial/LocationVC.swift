//
//  SecondViewController.swift
//  MapTrial
//
//  Created by SnehithNitin on 7/20/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController,UITableViewDelegate,UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate=self
    }
    
    let locationManager=CLLocationManager()
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
            map.showsUserLocation=true
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}

