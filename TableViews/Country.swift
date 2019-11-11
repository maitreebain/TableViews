//
//  Country.swift
//  TableViews
//
//  Created by Maitree Bain on 11/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct Country {
  let name: String
  let description: String
  let continent: String
  
    //Country.countries
  static let countries = [
    Country(name: "Saint Lucia", description: "Tropical :desert_island: paradise. Known as Helen of the West. Only drive-in volcano. National dish is green banana and salt fish. ", continent: "North America"),
    Country(name: "Columbia", description: "Historically troubled with natural beauty. Known for coffee (you’re welcome), ", continent: "South America"),
    Country(name: "Jamaica", description: "West Indian/Caribbean utopia. Origin of Reggae/Dancehall.  Birthplace of Bob Marley & Vybz Kartel. Know for cuisine choices such as ackee & salt fish, jerk everything, and mango’s", continent: "North America"),
    Country(name: "Bangladesh", description: "it’s hot.  Evidently the national dish is Hilsa Curry (hilsa is a fish).  But she likes tilapia. Muslin originally came from Bangladesh too. ", continent: "Asia"),
    Country(name: "America", description: "Known as Land of the free! The American dream. Our national dish are hamburgers ( originally made from a Hamburg steak) ", continent: "North America"),
    Country(name: "Nepal", description: "Landlocked country, Hinduism and Buddhism are the two main religion. Cows are sacred and cant be killed. Known for: Mt Everest....", continent: "Asia"),
    Country(name: "India", description: "Tropical country, very culturally diverse and curry is very popular there", continent: "Asia"),
    Country(name: "Ukraine", description: "Country in Eastern Europe with wonderful climate (full four seasons). Known for its tasty food (national dish is Borsch with pampushki (garlic bread)) and cozy stylish cafes.", continent: "Europe")
  ]
}
