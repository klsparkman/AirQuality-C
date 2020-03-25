//
//  CountriesListViewController.swift
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {
    
    var countries: [String] = [] {
        didSet {
            updateTableView()
        }
    }
    
    @IBOutlet weak var countryTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.delegate = self
        countryTableView.dataSource = self
        KLSCityAirQualityController.fetchSupportedCountries { (countries) in
            if let countries = countries {
                self.countries = countries
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStateVC" {
            guard let indexPath = countryTableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? StatesListViewController
                else {return}
            
            let selectedCountry = countries[indexPath.row]
            destinationVC.country = selectedCountry
        }
    }

    func updateTableView() {
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }

}

extension CountriesListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country
        return cell
    }
}
