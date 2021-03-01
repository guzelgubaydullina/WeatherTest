//
//  Weather.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Информация о погоде.
struct WeatherInfo: Codable {
    /// Информация о населенном пункте.
    var geoInfo: GeoInfo?
    /// Погода на данный момент.
    var weather: Weather?
}

extension WeatherInfo {
    enum CodingKeys: String, CodingKey {
        case geoInfo = "geo_object"
        case weather = "fact"
    }
}
