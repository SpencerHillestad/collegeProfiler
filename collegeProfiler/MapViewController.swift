//
//  MapViewController.swift
//  collegeProfiler
//
//  Created by shillestad on 3/2/16.
//  Copyright © 2016 shillestad. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController
{

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myMapView: MKMapView!
    
    var location = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTextField.text = location
        geoCodeLocation(location)
    }
    
    @IBAction func searchButtonTapped(sender: AnyObject)
    {
        geoCodeLocation(myTextField.text!)
    }
    
    func geoCodeLocation(Location: String)
    {
        let myGeoCode = CLGeocoder()
        myGeoCode.geocodeAddressString(Location) { (placeMarks, error) -> Void in
            if error != nil
            {
                print("error")
                
            }
            else
            {
                self.displayMap((placeMarks?.first)!)
            }
        }
    }
    func displayMap(MyPlacemark: CLPlacemark)
    {
        let myPin = MKPointAnnotation()
        myTextField.text = MyPlacemark.name
        let myLocation = MyPlacemark
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake((myLocation.location?.coordinate)!, span)
        myMapView.setRegion(region, animated: true)
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlacemark.name
        myMapView.addAnnotation(myPin)
    }

}
