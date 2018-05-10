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
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInputAlert(title: String, placeholder: String, completion: @escaping ((String) -> Void)) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] _ in
            let info = alert?.textFields![0].text
            completion(info ?? "")
        }))
        self.present(alert, animated: true, completion: nil)
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.NavigationBar.tintColor
    }


}

