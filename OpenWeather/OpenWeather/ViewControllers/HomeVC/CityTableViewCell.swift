//
//  CityTableViewCell.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import UIKit

let cityTableViewCellIdentifier = "CityTableViewCellIdentifier"

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var city: String = "" {
        didSet {
            update(with: city)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.Home.CityCellBackgroundColor
        
        nameLabel.textColor = UIColor.Home.CityCellTextColor
        nameLabel.font = UIFont.Home.CityCellFont
    }
    
    private func update(with city: String) {
        nameLabel.text = city
    }

}
