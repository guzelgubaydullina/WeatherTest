//
//  Weather.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation

/// Погода на данный момент.
struct Weather: Codable {
    /// Температура (градусы Цельсия).
    var temperature: Int
    /// Ощущаемая температура (градусы Цельсия).
    var feelsLike: Int
    /// Код расшифровки погодного описания (строка).
    private var conditionString: String
    /// Код расшифровки погодного описания.
    var condition: Condition {
        guard let condition = Condition(rawValue: conditionString) else {
            return .unknown
        }
        return condition
    }
    /// Скорость ветра (м/с).
    var windSpeed: Double
    /// Направление ветра (строка).
    private var windDirectionString: String
    /// Направление ветра.
    var windDirection: WindDirection {
        guard let direction = WindDirection(rawValue: windDirectionString) else {
            return .unknown
        }
        return direction
    }
    /// Давление (мм.рт.ст.).
    var pressure: Double
    /// Влажность воздуха (%).
    var humidity: Int
    /// Светлое или темное время суток (строка).
    private var dayTimeString: String
    // Светлое или темное время суток.
    var dayTime: DayTime {
        guard let dayTime = DayTime(rawValue: dayTimeString) else {
            return .unknown
        }
        return dayTime
    }
    /// Признак грозы.
    var isThunder: Bool
    /// Тип осадков (целое число).
    private var precipitationTypeInt: Int
    /// Тип осадков.
    var precipitationType: PrecipitationType {
        guard let precipitationType = PrecipitationType(rawValue: precipitationTypeInt) else {
            return .unknown
        }
        return precipitationType
    }
    /// Облачность (дробное число).
    private var cloudnessDouble: Double
    /// Облачность.
    var cloudness: Cloudness {
        guard let cloudness = Cloudness(rawValue: cloudnessDouble) else {
            return .unknown
        }
        return cloudness
    }
}

extension Weather {
    func conditionImageName() -> String {
        var imageName = ""
        switch condition {
        case .unknown:
            imageName = ""
        case .clear:
            imageName = "icon_clear"
        case .partlyCloudy:
            imageName = "icon_partlyCloudy"
        case .cloudy:
            imageName = "icon_cloudy"
        case .overcast:
            imageName = "icon_overcast"
        case .drizzle:
            imageName = "icon_drizzle"
        case .lightRain:
            imageName = "icon_lightRain"
        case .rain:
            imageName = "icon_rain"
        case .moderateRain:
            imageName = "icon_moderateRain"
        case .heavyRain:
            imageName = "icon_heavyRain"
        case .continuousHeavyRain:
            imageName = "icon_continuousHeavyRain"
        case .showers:
            imageName = "icon_showers"
        case .wetSnow:
            imageName = "icon_wetSnow"
        case .lightSnow:
            imageName = "icon_lightSnow"
        case .snow:
            imageName = "icon_snow"
        case .snowShowers:
            imageName = "icon_snowShowers"
        case .hail:
            imageName = "icon_hail"
        case .thunderstorm:
            imageName = "icon_thunderstorm"
        case .thunderstormWithRain:
            imageName = "icon_thunderstormWithRain"
        case .thunderstormWithHail:
            imageName = "icon_thunderstormWithHail"
        }
        
        if !imageName.isEmpty {
            var postfix = ""
            switch dayTime {
            case .unknown:
                postfix = ""
            case .day:
                postfix = "Day"
            case .night:
                postfix = "Night"
            }
            imageName = imageName + postfix
        }
        return imageName
    }
}

extension Weather {
    func conditionAnimationName() -> String {
        var imageName = ""
        switch condition {
        case .unknown:
            imageName = ""
        case .clear:
            imageName = "lottie_clear"
        case .partlyCloudy:
            imageName = "lottie_partlyCloudy"
        case .cloudy:
            imageName = "lottie_cloudy"
        case .overcast:
            imageName = "lottie_overcast"
        case .drizzle:
            imageName = "lottie_drizzle"
        case .lightRain:
            imageName = "lottie_lightRain"
        case .rain:
            imageName = "lottie_rain"
        case .moderateRain:
            imageName = "lottie_moderateRain"
        case .heavyRain:
            imageName = "lottie_heavyRain"
        case .continuousHeavyRain:
            imageName = "lottie_continuousHeavyRain"
        case .showers:
            imageName = "lottie_showers"
        case .wetSnow:
            imageName = "lottie_wetSnow"
        case .lightSnow:
            imageName = "lottie_lightSnow"
        case .snow:
            imageName = "lottie_snow"
        case .snowShowers:
            imageName = "lottie_snowShowers"
        case .hail:
            imageName = "lottie_hail"
        case .thunderstorm:
            imageName = "lottie_thunderstorm"
        case .thunderstormWithRain:
            imageName = "lottie_thunderstormWithRain"
        case .thunderstormWithHail:
            imageName = "lottie_thunderstormWithHail"
        }
        
        if !imageName.isEmpty {
            var postfix = ""
            switch dayTime {
            case .unknown:
                postfix = ""
            case .day:
                postfix = "Day"
            case .night:
                postfix = "Night"
            }
            imageName = imageName + postfix
        }
        return imageName
    }
}

extension Weather {
    func conditionDescription() -> String {
        var description = ""
        switch condition {
        case .unknown:
            description = ""
        case .clear:
            description = "Ясно"
        case .partlyCloudy:
            description = "Малооблачно"
        case .cloudy:
            description = "Облачно с прояснениями"
        case .overcast:
            description = "Пасмурно"
        case .drizzle:
            description = "Морось"
        case .lightRain:
            description = "Небольшой дождь"
        case .rain:
            description = "Дождь"
        case .moderateRain:
            description = "Умеренно сильный дождь"
        case .heavyRain:
            description = "Сильный дождь"
        case .continuousHeavyRain:
            description = "Длительный сильный дождь"
        case .showers:
            description = "Ливень"
        case .wetSnow:
            description = "Дождь со снегом"
        case .lightSnow:
            description = "Небольшой снег"
        case .snow:
            description = "Снег"
        case .snowShowers:
            description = "Снегопад"
        case .hail:
            description = "Град"
        case .thunderstorm:
            description = "Гроза"
        case .thunderstormWithRain:
            description = "Дождь с грозой"
        case .thunderstormWithHail:
            description = "Гроза с градом"
        }
        return description
    }
}

extension Weather {
    func windDirectionDescription() -> String {
        var description = ""
        switch windDirection {
        case .unknown:
            description = ""
        case .northwest:
            description = "Северо-западное"
        case .north:
            description = "Северное"
        case .northEastern:
            description = "Северо-восточное"
        case .eastern:
            description = "Восточное"
        case .southEastern:
            description = "Юго-восточное"
        case .south:
            description = "Южное"
        case .southwest:
            description = "Юго-западное"
        case .west:
            description = "Западное"
        case .calm:
            description = "Штиль"
        }
        return description
    }
}

extension Weather {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case conditionString = "condition"
        case windSpeed = "wind_speed"
        case windDirectionString = "wind_dir"
        case pressure = "pressure_mm"
        case humidity = "humidity"
        case dayTimeString = "daytime"
        case isThunder = "is_thunder"
        case precipitationTypeInt = "prec_type"
        case cloudnessDouble = "cloudness"
    }
}
