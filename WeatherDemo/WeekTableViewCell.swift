//
//  WeekTableViewCell.swift
//  WeatherDemo
//
//  Created by 沈韶泓 on 2016/11/26.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {
    @IBOutlet weak var labelWeek: UILabel!
    @IBOutlet weak var labelToday: UILabel!

    @IBOutlet weak var labelHighTemperature: UILabel!
    @IBOutlet weak var labelLowTemperature: UILabel!
    
    @IBOutlet weak var imageWeatherIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
