//
//  CountryDetailedVC.swift
//  ConcurrencyLab
//
//  Created by David Lin on 12/9/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class CountryDetailedVC: UIViewController {
    
    var countryDetails: CountryList!
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    func loadData() {
        countryName.text = countryDetails.name
        countryCapital.text = countryDetails.capital
        countryPopulation.text = countryDetails.population.description
        
        ImageClient.fetchImage(for: "https://www.countryflags.io/\(countryDetails.alpha2Code)/flat/64.png") { [unowned self](result) in
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
