//
//  CityCellInfoViewModel.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

struct CityCellInfoViewModel: CityCellViewModelProtocol {
    let type: CityCellViewModelType = .info
    let title: String
    let value: String
}
