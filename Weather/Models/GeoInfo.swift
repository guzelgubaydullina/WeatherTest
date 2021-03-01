//
//  GeoInfo.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Информация о населенном пункте.
struct GeoInfo: Codable {
    /// Район.
    var district: GeoObject?
    /// Город.
    var locality: GeoObject?
    /// Регион.
    var province: GeoObject?
    /// Страна.
    var country: GeoObject?
}
