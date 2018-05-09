//
//  HomeViewController.swift
//  OpenWeather
//
//  Created by Roxane Gud on 5/9/18.
//  Copyright © 2018 Roxane Markhyvka. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var citiesTableView: PlaceholderTableView!
    
    var bookmarkedCities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        loadData()
    }
    
    private func loadData() {
        bookmarkedCities = ["Lviv", "London", "Blah-blah"]
        citiesTableView.reloadData()
    }
    
    private func setupUI() {
        citiesTableView.placeholderMessage = DisplayMessages.noCitiesMessage
    }
    
    
    // MARK: - Navigation
    //------------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCityWeatherSegueIdentifier" {
            
            if let selectedCell = sender as? CityTableViewCell,
                let cityWeatherVC = segue.destination as? CityWeatherViewController{
                    cityWeatherVC.city = selectedCell.city
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkedCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: cityTableViewCellIdentifier,
                                                    for: indexPath) as? CityTableViewCell
        
        let cell = reuseCell ?? CityTableViewCell()
        cell.city = bookmarkedCities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            bookmarkedCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
