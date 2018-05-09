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
    
    var city: String = "" {
        didSet {
            cityLabel?.text = city
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        cityLabel.text = city
        
        OpenWeatherServerManager.shared.getWeather(for: "Lviv")
    }

}
