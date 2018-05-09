//
//  CityWeatherViewController.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import UIKit

class CityWeatherViewController: BaseViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var city: String = "" {
        didSet {
            cityLabel?.text = city
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabels()
        setupActivityIndicator()
        loadData()
    }
    
    private func loadData() {
        activityIndicator.startAnimating()
        
        OpenWeatherServerManager.shared.getWeather(for: city) { [weak self] weather, error in
            DispatchQueue.main.async{
                self?.activityIndicator.stopAnimating()
                
                guard error == nil, let weather = weather else {
                    let message = error?.localizedDescription ?? ErrorAlert.NoWeatherErrorMessage
                    self?.showAlert(title: ErrorAlert.NoWeatherErrorTitle, message: message)
                    return
                }
                
                self?.update(with: weather)
            }
        }
    }
    
    private func update(with weather: Weather) {
        cityLabel.text = city
        dateLabel.text = Date().weekdayDescription()
        temperatureLabel.text = String(format: "%.1f°", weather.temperature)
        descriptionLabel.text = weather.description
    }
    
    private func setupLabels() {
        let labels = [cityLabel, dateLabel, temperatureLabel, descriptionLabel]
        
        for label in labels {
            label?.textColor = UIColor.CityWeather.GeneralInfoTextColor
            label?.textAlignment = .center
            label?.font = UIFont.CityWeather.GeneralInfoFont
        }
        
        cityLabel.font = UIFont.CityWeather.CityNameFont
        temperatureLabel.font = UIFont.CityWeather.TemperatureFont
        
        loadPlaceholderValues()
    }
    
    private func setupActivityIndicator() {
        activityIndicator.color = UIColor.CityWeather.ActivityIndicatorColor
        activityIndicator.hidesWhenStopped = true
    }
    
    private func loadPlaceholderValues() {
        cityLabel.text = city
        dateLabel.text = Date().weekdayDescription()
        temperatureLabel.text = "0°"
        descriptionLabel.text = "-"
    }

}
