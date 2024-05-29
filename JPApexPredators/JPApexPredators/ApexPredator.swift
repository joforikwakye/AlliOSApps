//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Jeffrey Kwakye on 22/05/2024.
//

import Foundation
import SwiftUI
import MapKit

//making the apexpredator a decodable. this will enable this model get the data from another format which is the json format to a format swift can display
struct ApexPredator: Decodable, Identifiable {
    //so this is like a class. i think i have done this several times. this is where we model the data we are going to get from the backend. but in swift we use structs to create these "classes" like in other languages. apple says to use struct by default to create your models if you don't need all those extra functionalities provided by a class.
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    
    var image:String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
   
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
 
}


enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    
    case all
    case land
    case air
    case sea
    
    var id: PredatorType {self}

       
       var background: Color {
           switch self {
               
           case .land:
                   .brown
           case .air:
                   .teal
           case .sea:
                   .blue
           case .all:
                   .red
           }
       }
    
    var icon: String {
        switch self {
            
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}
