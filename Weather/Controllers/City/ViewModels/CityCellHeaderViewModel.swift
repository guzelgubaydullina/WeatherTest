//
//  CityCellHeaderViewModel.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

struct CityCellHeaderViewModel: CityCellViewModelProtocol {
    let type: CityCellViewModelType = .header
    let city: String
    let condition: String
    let temperature: String
    let animationName: String
}
