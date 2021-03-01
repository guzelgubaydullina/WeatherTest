//
//  CitiesListCityCell.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import UIKit

class CitiesListCityCell: UITableViewCell {
    @IBOutlet weak var citiesNameLabel: UILabel!
    @IBOutlet weak var forecastIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func bind(info: WeatherInfo) {
        citiesNameLabel.text = info.geoInfo?.locality?.name ?? ""
        forecastIconImageView.image = UIImage(named: info.weather?.conditionImageName() ?? "")
        let temperature = info.weather?.temperature ?? 0
        temperatureLabel.text = String(format: "%@%ld", temperature > 0 ? "+" : "", temperature)
    }
}
