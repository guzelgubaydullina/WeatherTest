//
//  Cloudness.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Облачность.
enum Cloudness: Double {
    /// Неизвестно.
    case unknown = -1.0
    /// Ясно.
    case clear = 0.0
    /// Малооблачно.
    case lowClouds = 0.25
    /// Облачно с прояснениями (1).
    case partlyCloudyFirst = 0.5
    /// Облачно с прояснениями (2).
    case partlyCloudySecond = 0.75
    /// Пасмурно.
    case cloudy = 1.0
}
