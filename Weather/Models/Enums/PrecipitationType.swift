//
//  PrecipitationType.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Тип осадков.
enum PrecipitationType: Int {
    /// Неизвестный тип.
    case unknown = -1
    /// Без осадков.
    case noPrecipitation = 0
    /// Дождь.
    case rain = 1
    /// Дождь со снегом.
    case rainAndSnow = 2
    /// Снег.
    case snow = 3
    /// Град.
    case hail = 4
}
