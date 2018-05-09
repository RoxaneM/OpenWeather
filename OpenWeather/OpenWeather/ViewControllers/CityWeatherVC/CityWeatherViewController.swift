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
    
    var city: String = "" {
        didSet {
            cityLabel?.text = city
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabels()
        loadData()
    }
    
    private func loadData() {
        OpenWeatherServerManager.shared.getWeather(for: city)
    }
    
    private func setupLabels() {
        cityLabel.text = city
        
        let labels = [cityLabel, dateLabel, temperatureLabel, descriptionLabel]
        
        for label in labels {
            label?.textColor = UIColor.CityWeather.GeneralInfoTextColor
            label?.textAlignment = .center
            label?.font = UIFont.CityWeather.GeneralInfoFont
        }
        
        cityLabel.font = UIFont.CityWeather.CityNameFont
        temperatureLabel.font = UIFont.CityWeather.TemperatureFont
    }

}
