//
//  ViewController.swift
//  ConcurrencyLab
//
//  Created by David Lin on 12/9/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var countries = [CountryList]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }

    func loadData() {
        countries = CountryList.getCountries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let country = segue.destination as? CountryDetailedVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        country.countryDetails = countries[indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("")
        }
        let country = countries[indexPath.row]
        cell.configureCell(for: country)
        return cell
    }
}
