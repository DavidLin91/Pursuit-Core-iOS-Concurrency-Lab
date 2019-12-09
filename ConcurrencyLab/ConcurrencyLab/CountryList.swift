//
//  CountryList.swift
//  ConcurrencyLab
//
//  Created by David Lin on 12/9/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

//https://www.countryflags.io/be/flat/64.png"

struct CountryList: Decodable {
    let name: String
    let alpha2Code: String
    let capital: String
    let population: Int
//    let currencies: Dictionary
}

//struct Dictionary: Decodable {
//    let code: String
//}

extension CountryList {
    static func getCountries() -> [CountryList] {
        var countries = [CountryList]()
    
        guard let fileURL = Bundle.main.url(forResource: "countrylist", withExtension: "json") else {
            fatalError("")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let countryData = try JSONDecoder().decode([CountryList].self, from: data)
            countries = countryData
        } catch {
            fatalError("\(error)")
        }
        return countries
    }
}
