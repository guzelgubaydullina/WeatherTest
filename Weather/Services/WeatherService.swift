//
//  WeatherService.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    static let instance = WeatherService()
    
    private let accessToken = "9cb26362-194e-4098-afa4-1b74ff4becb1"
    private let baseUrl = "https://api.weather.yandex.ru/v2/forecast"
    private lazy var commonParameters: [String: Any] = [
        "lang": "ru_RU",
        "limit": 1,
        "hours": false,
        "extra": false
    ]
    
    private init() {}
    
    func loadWeather(locationCoordinate: LocationCoordinate, handler: @escaping (Result<WeatherInfo, Error>) -> Void) {
        let requestParameters: [String: Any] = [
            "lat": locationCoordinate.latitude,
            "lon": locationCoordinate.longitude
        ] + commonParameters
        let authHeader = HTTPHeader(name: "X-Yandex-API-Key", value: accessToken)
        let headers = HTTPHeaders([authHeader])
        AF.request(baseUrl,
                   method: .get,
                   parameters: requestParameters,
                   headers: headers)
            .validate()
            .responseData { responseData in
                guard let data = responseData.data else {
                    handler(.failure(WeatherServiceErrors.error("Data error")))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let weatherInfo = try decoder.decode(WeatherInfo.self,
                                                         from: data)
                    handler(.success(weatherInfo))
                } catch {
                    handler(.failure(error))
                }
            }
    }
}
