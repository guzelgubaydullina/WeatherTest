//
//  WindDIrection.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Направление ветра.
enum WindDirection: String {
    /// Неизвестное направление.
    case unknown
    /// Северо-западное.
    case northwest = "nw"
    /// Северное.
    case north = "n"
    /// Северо-восточное.
    case northEastern = "ne"
    /// Восточное.
    case eastern = "e"
    /// Юго-восточное.
    case southEastern = "se"
    /// Южное.
    case south = "s"
    /// Юго-западное.
    case southwest = "sw"
    /// Западное.
    case west = "w"
    /// Штиль.
    case calm = "с"
}
