//
//  RickAndMortyApi.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 12/07/2023.
//

import Foundation

class RickAndMortyApi {
    
    let baseUrl = "https://rickandmortyapi.com/api"
    
    
    struct ResponseInfo<Element: Decodable>: Decodable {
        let info: Info
        let results: [Element]
        
        struct Info: Decodable {
            let count: Int
            let pages: Int
            let next: String?
            let prev: String?
        }
    }
}
