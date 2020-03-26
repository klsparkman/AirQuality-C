//
//  DetailViewController.swift
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    // MARK: - Properties
    var country: String?
    var state: String?
    var city: String?
    
    // MARK: - Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = city,
            let state = state,
            let country = country
            else { return }
        
        KLSCityAirQualityController.fetchData(forCity: city, state: state, country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
        }
    }
    
    // MARK: - Class Methods
    func updateViews(with details: KLSCityAirQualityModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = "City: \(details.city)"
            self.stateLabel.text = "State: \(details.state)"
            self.countryLabel.text = "Country: \(details.country)"
            self.aqiLabel.text = "Air Quality Index: \(details.pollution.airQualityIndexUS)"
            self.windSpeedLabel.text = "Wind speed: \(details.weather.windSpeed)"
            self.temperatureLabel.text = "Temperature: \(details.weather.temp)"
            self.humidityLabel.text = "Humidity: \(details.weather.humidity)"
        }
    }
}
