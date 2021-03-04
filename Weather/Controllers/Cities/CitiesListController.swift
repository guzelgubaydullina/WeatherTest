//
//  CitiesListController.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import UIKit
import PromiseKit

class CitiesListController: UITableViewController {
    @IBOutlet weak var citiesSearchBar: UISearchBar!
    
    private var isSearching: Bool {
        return !(citiesSearchBar.text?.isEmpty ?? true)
    }
    
    private var weathers = [WeatherInfo]()
    private var filteredWeathers = [WeatherInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        performNetworkRequest()
    }
    
    @objc private func performNetworkRequest() {
        let coordinates = buildLocationCoordinates()
        var promises = [Promise<WeatherInfo>]()
        for coordinate in coordinates {
            let promise = promiseFetchWeatherInfo(coordinate: coordinate)
            promises.append(promise)
        }
        
        when(fulfilled: promises).done { [weak self] results in
            self?.weathers = results
            self?.refreshControl?.endRefreshing()
            self?.tableView.reloadData()
        }.catch { [weak self] error in
            self?.refreshControl?.endRefreshing()
            self?.showError(error: error)
        }
    }
    
    private func configureViewController() {
        tableView.tableFooterView = UIView()
        addRefreshControl()
    }
    
    private func addRefreshControl() {
        guard refreshControl == nil else { return }
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self,
                                  action: #selector(performNetworkRequest),
                                  for: .valueChanged)
    }
    
    private func buildLocationCoordinates() -> [LocationCoordinate] {
        // Москва
        let coordinate1 = LocationCoordinate(latitude: 55.755814,
                                             longitude: 37.617635)
        // Санкт-Петербург
        let coordinate2 = LocationCoordinate(latitude: 59.939095,
                                             longitude: 30.315868)
        // Уфа
        let coordinate3 = LocationCoordinate(latitude: 54.735147,
                                             longitude: 55.958727)
        // Калининград
        let coordinate4 = LocationCoordinate(latitude: 54.710157,
                                             longitude: 20.510137)
        // Нью-Йорк
        let coordinate5 = LocationCoordinate(latitude: 40.714599,
                                             longitude: -74.002791)
        // Стамбул
        let coordinate6 = LocationCoordinate(latitude: 41.011218,
                                             longitude: 28.978169)
        // Афины
        let coordinate7 = LocationCoordinate(latitude: 37.975527,
                                             longitude: 23.734855)
        // Зальцбург
        let coordinate8 = LocationCoordinate(latitude: 47.809485,
                                             longitude: 13.055009)
        // Тбилиси
        let coordinate9 = LocationCoordinate(latitude: 41.693076,
                                             longitude: 44.801552)
        // Никосия
        let coordinate10 = LocationCoordinate(latitude: 35.172867,
                                              longitude: 33.354168)
        return [
            coordinate1,
            coordinate2,
            coordinate3,
            coordinate4,
            coordinate5,
            coordinate6,
            coordinate7,
            coordinate8,
            coordinate9,
            coordinate10
        ]
    }

    private func showError(error: Error) {
        let alertController = UIAlertController(title: "Ошибка",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alertController.addAction(actionOk)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredWeathers.count : weathers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesListCityCell", for: indexPath) as? CitiesListCityCell else {
            return UITableViewCell()
        }
        let weather = isSearching ? filteredWeathers[indexPath.row] : weathers[indexPath.row]
        cell.bind(info: weather)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return isSearching ? false : true
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            weathers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Promises
    
    private func promiseFetchWeatherInfo(coordinate: LocationCoordinate) -> Promise<WeatherInfo> {
        return Promise<WeatherInfo> { seal in
            WeatherService.instance.loadWeather(locationCoordinate: coordinate) { result in
                switch result {
                case .success(let weatherInfo):
                    seal.fulfill(weatherInfo)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowCityController" {
            guard let viewController = segue.destination as? CityController,
                let selectedIndexPath = tableView.indexPathForSelectedRow else {
                    return
            }

            var weatherInfo: WeatherInfo?
            if isSearching {
                weatherInfo = filteredWeathers[selectedIndexPath.row]
            } else {
                weatherInfo = weathers[selectedIndexPath.row]
            }
            viewController.weatherInfo = weatherInfo!
        }
    }
}

extension CitiesListController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredWeathers = weathers.filter {
            ($0.geoInfo?.locality?.name.lowercased() ?? "").contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        citiesSearchBar.text = ""
        filteredWeathers = []
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
