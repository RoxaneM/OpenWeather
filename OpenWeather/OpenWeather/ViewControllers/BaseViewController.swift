//
//  ViewController.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()

    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.NavigationBar.tintColor
    }


}

