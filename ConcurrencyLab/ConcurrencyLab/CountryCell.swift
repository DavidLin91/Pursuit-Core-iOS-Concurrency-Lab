//
//  CountryCell.swift
//  ConcurrencyLab
//
//  Created by David Lin on 12/9/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    
    
    func configureCell(for country: CountryList) {
        countryNameLabel.text = country.name
        countryCapitalLabel.text = country.capital
        countryPopulationLabel.text = country.population.description
        
        ImageClient.fetchImage(for: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { [unowned self](result) in
                switch result {
                case.success( let image):
                    
                    // UPDATE ANY UO ELEMENTS ON THE MAIN THREAD
                    DispatchQueue.main.async {
                        self.flagImage.image = image
                    }
                case.failure( let error):
                    (print("configueCell image error - \(error)"))
                }
            }
        }
    }


