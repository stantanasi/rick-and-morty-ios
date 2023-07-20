//
//  Character.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 12/07/2023.
//

import Foundation

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    enum Status: String, Decodable {
        case Alive
        case Dead
        case unknown
    }
    
    enum Gender: String, Decodable {
        case Female
        case Male
        case Genderless
        case unknown
    }

    struct Origin: Decodable {
        let name: String
        let url: String
    }

    struct Location: Decodable {
        let name: String
        let url: String
    }
}
