//
//  WeatherCellTableViewCell.swift
//  rainyshinycloudy
//
//  Created by Shehryar Khan on 29.08.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!

    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
    }

}
