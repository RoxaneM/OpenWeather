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
        
        loadData()
    }
    
    private func loadData() {
        bookmarkedCities = ["Lviv", "London"]
        citiesTableView.reloadData()
    }
    
    private func setupUI() {
        citiesTableView.placeholderMessage = "OOPS!\n No bookmarked cities yet. Click '+' button to add city"
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

extension HomeViewController: UITableViewDataSource {
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
    
}
