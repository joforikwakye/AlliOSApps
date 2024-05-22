//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Jeffrey Kwakye on 22/05/2024.
//

import Foundation


//making the apexpredator a decodable. this will enable this model get the data from another format which is the json format to a format swift can display
struct ApexPredator: Decodable {
    //so this is like a class. i think i have done this several times. this is where we model the data we are going to get from the backend. but in swift we use structs to create these "classes" like in other languages. apple says to use struct by default to create your models if you don't need all those extra functionalities provided by a class.
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
   
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}
