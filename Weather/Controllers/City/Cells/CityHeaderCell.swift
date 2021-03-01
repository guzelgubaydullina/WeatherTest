//
//  CityHeaderCell.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import UIKit
import Lottie

class CityHeaderCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var animationView: AnimationView!
    
    func bind(viewModel: CityCellHeaderViewModel) {
        cityLabel.text = viewModel.city
        conditionLabel.text = viewModel.condition
        temperatureLabel.text = viewModel.temperature
        animationView.animation = Animation.named(viewModel.animationName)
        animationView.loopMode = .loop
        animationView.play()
    }
}

