//
//  WeatherServiceErrors.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

enum WeatherServiceErrors: Error {
    case error(String)
}

extension WeatherServiceErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .error(let message):
            return message
        }
    }
}
