//
//  CityController.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import UIKit

class CityController: UITableViewController {
    var weatherInfo: WeatherInfo!
    
    private var viewModels = [CityCellViewModelProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViewModel()
    }
    
    private func buildViewModel() {
        let temperature = weatherInfo.weather?.temperature ?? 0
        let temperatureString = String(format: "%@%ld", temperature > 0 ? "+" : "", temperature)
        let headerViewModel = CityCellHeaderViewModel(city: weatherInfo.geoInfo?.locality?.name ?? "",
                                                      condition: weatherInfo.weather?.conditionDescription() ?? "",
                                                      temperature: temperatureString,
                                                      animationName: weatherInfo.weather?.conditionAnimationName() ?? "")
        
        let infoViewModel1 = CityCellInfoViewModel(title: "Ощущаемая температура",
                                                   value: String(weatherInfo.weather?.feelsLike ?? 0))
        
        let infoViewModel2 = CityCellInfoViewModel(title: "Скорость ветра, м/с",
                                                   value: String(weatherInfo.weather?.windSpeed ?? 0))
        
        let infoViewModel3 = CityCellInfoViewModel(title: "Направление ветра",
                                                   value: weatherInfo.weather?.windDirectionDescription() ?? "")
        
        let infoViewModel4 = CityCellInfoViewModel(title: "Давление, мм.рт.ст",
                                                   value: String(weatherInfo.weather?.pressure ?? 0))
        
        let infoViewModel5 = CityCellInfoViewModel(title: "Влажность воздуха, %",
                                                   value: String(weatherInfo.weather?.humidity ?? 0))
        
        viewModels = [
            headerViewModel,
            infoViewModel1,
            infoViewModel2,
            infoViewModel3,
            infoViewModel4,
            infoViewModel5
        ]
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        if viewModel.type == .header {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityHeaderCell", for: indexPath) as? CityHeaderCell else {
                return UITableViewCell()
            }
            cell.bind(viewModel: viewModel as! CityCellHeaderViewModel)
            return cell
        } else if viewModel.type == .info {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityInfoCell", for: indexPath) as? CityInfoCell else {
                return UITableViewCell()
            }
            cell.bind(viewModel: viewModel as! CityCellInfoViewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
