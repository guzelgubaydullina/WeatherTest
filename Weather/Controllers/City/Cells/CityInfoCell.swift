//
//  CityInfoCell.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import UIKit

class CityInfoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTitleLabel: UILabel!
    
    func bind(viewModel: CityCellInfoViewModel) {
        titleLabel.text = viewModel.title
        valueTitleLabel.text = viewModel.value
    }
}
