//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by 郭钰麟 on 16/2/23.
//  Copyright © 2016年 Yuln. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView:MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmantedControl = UISegmentedControl(items:["Standard","Hybrid","Satellite"])
        segmantedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmantedControl.selectedSegmentIndex = 0
        segmantedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmantedControl)
        
        //let topConstrain = segmantedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topConstrain = segmantedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,constant: 8)
        //let leadingConstrain = segmantedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        //let trailingConstrain = segmantedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstrain = segmantedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstrain = segmantedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstrain.active = true
        leadingConstrain.active = true
        trailingConstrain.active = true
        
        segmantedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
    }
    
    func mapTypeChanged(segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 3:
            mapView.mapType = .Satellite
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("2")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
