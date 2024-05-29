//
//  Predators.swift
//  JPApexPredators
//
//  Created by Jeffrey Kwakye on 22/05/2024.
//

import Foundation

//this class is decoding the data from the apexpredator and storing it in an array.

class Predators {
    
    var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        //getting the jpapexpredators.json file from the file tree. the url that points to the main project folder is the main bundle url
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
                
            } catch {
                print("error decoding data: \(error)")
            }
        }
    }
    
    //searching for a predator
    func search(for searchText: String) -> [ApexPredator] {
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    //sorting the list data
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    //filtering by type
    func filter(by predatorType: PredatorType) {
        if predatorType == .all {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter { predator in
                predator.type == predatorType
            }
        }
    }
    
}


//sort is an inplace function. it changes the actual list. filter creates a temporary list
