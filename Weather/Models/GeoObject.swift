//
//  GeoObject.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Информация о локации.
struct GeoObject: Codable {
    /// Id.
    var id: Int
    /// Название.
    var name: String
}
