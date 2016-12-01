//
//  HeaderTableViewCell.swift
//  WeatherDemo
//
//  Created by 沈韶泓 on 2016/11/26.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelWeatherSituation: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
