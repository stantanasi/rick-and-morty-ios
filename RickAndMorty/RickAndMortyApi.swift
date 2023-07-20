//
//  RickAndMortyApi.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 12/07/2023.
//

import Foundation

class RickAndMortyApi {
    
    let baseUrl = "https://rickandmortyapi.com/api"
    
    
    func getAllCharacters() async throws -> ResponseInfo<Character> {
        let url = URL(string: "\(baseUrl)/character")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(ResponseInfo<Character>.self, from: data)
        
        return decoded
    }
    
    
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
