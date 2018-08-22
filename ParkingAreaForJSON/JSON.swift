//
//  JSON.swift
//  ParkingAreaForJSON
//
//  Created by HsiaoHsien Huang on 2018/8/20.
//  Copyright © 2018年 HsiaoHsien Huang. All rights reserved.
//

import Foundation

struct Parkings: Codable {
    var areaName: String
    var parkName: String
    var totalSpace: Int
    var address: String
    var payGuide: String
}

struct JSONDB: Codable {
    var parkingLots: [Parkings]
}


