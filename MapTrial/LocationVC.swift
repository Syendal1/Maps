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
    
    let addresses=[
    "9466 Black Mountain Rd San Diego, CA 92126",
    "10320 Maya Linda Rd San Diego, CA 92126 "
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate=self
        
        for x in addresses{
            getPlacemarkFromAddress(x)
        }
        
    }
    
    let locationManager=CLLocationManager()
    let regionRadius:CLLocationDistance=1000
    
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
    
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let loc=userLocation.location{
            centerMapLocation(loc)
        }
    }
    
    func centerMapLocation(location:CLLocation){
        let coordinateRegion=MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2, regionRadius*2)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    
    func getPlacemarkFromAddress(address:String){
        CLGeocoder().geocodeAddressString(address) { (placemarks:[CLPlacemark]?, error:NSError?) in
            if let marks=placemarks where marks.count>0{
                if let loc=marks[0].location{
                    self.createAnnotationForLocation(loc)
                }
            }
        }
    }
    
    func createAnnotationForLocation(location:CLLocation){
        let bootcamp=BootcampAnnotation(coordinate:location.coordinate)
        map.addAnnotation(bootcamp)
     
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

