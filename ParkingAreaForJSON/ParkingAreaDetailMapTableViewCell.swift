//
//  ParkingAreaDetailMapTableViewCell.swift
//  ParkingAreaForJSON
//
//  Created by HsiaoHsien Huang on 2018/8/21.
//  Copyright © 2018年 HsiaoHsien Huang. All rights reserved.
//

import UIKit
import MapKit

class ParkingAreaDetailMapTableViewCell: UITableViewCell {

    @IBOutlet var DetailMap: MKMapView!
    var DetailAddress: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        //取得位置
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                //取得第一個地點標記
                let placemark = placemarks[0]
                
                //加上標記
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.DetailMap.addAnnotation(annotation)
                    
                    //設定縮放程度
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.DetailMap.setRegion(region, animated: false)
                }
            }
        })
    }

}
