//
//  ParkingAreaTableViewCell.swift
//  ParkingAreaForJSON
//
//  Created by HsiaoHsien Huang on 2018/8/21.
//  Copyright © 2018年 HsiaoHsien Huang. All rights reserved.
//

import UIKit

class ParkingAreaTableViewCell: UITableViewCell {
    
    @IBOutlet var areaName: UILabel!
    @IBOutlet var parkName: UILabel!
    @IBOutlet var totalSpace: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
