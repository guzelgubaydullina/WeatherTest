//
//  Condition.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Погодное описание.
enum Condition: String {
    /// Неизвестное.
    case unknown
    /// Ясно.
    case clear = "clear"
    /// Малооблачно.
    case partlyCloudy = "partly-cloudy"
    /// Облачно с прояснениями.
    case cloudy = "cloudy"
    /// Пасмурно.
    case overcast = "overcast"
    /// Морось.
    case drizzle = "drizzle"
    /// Небольшой дождь.
    case lightRain = "light-rain"
    /// Дождь.
    case rain = "rain"
    /// Умеренно сильный дождь.
    case moderateRain = "moderate-rain"
    /// Сильный дождь.
    case heavyRain = "heavy-rain"
    /// Длительный сильный дождь.
    case continuousHeavyRain = "continuous-heavy-rain"
    /// Ливень.
    case showers = "showers"
    /// Дождь со снегом.
    case wetSnow = "wet-snow"
    /// Небольшой снег.
    case lightSnow = "light-snow"
    /// Снег.
    case snow = "snow"
    /// Снегопад.
    case snowShowers = "snow-showers"
    /// Град.
    case hail = "hail"
    /// Гроза.
    case thunderstorm = "thunderstorm"
    /// Дождь с грозой.
    case thunderstormWithRain = "thunderstorm-with-rain"
    /// Гроза с градом.
    case thunderstormWithHail = "thunderstorm-with-hail"
}
