//
//  RickAndMortyApi.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 12/07/2023.
//

import Foundation

class RickAndMortyApi {
    
    let baseUrl = "https://rickandmortyapi.com/api"
    
    
    func getAllCharacters(page: Int = 1) async throws -> ResponseInfo<Character> {
        let url = URL(string: "\(baseUrl)/character")!.appending(queryItems: [
            URLQueryItem(name: "page", value: String(page))
        ])
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(ResponseInfo<Character>.self, from: data)
        
        return decoded
    }
    
    func getSingleCharacter(id: Int) async throws -> Character {
        let url = URL(string: "\(baseUrl)/character/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(Character.self, from: data)
        
        return decoded
    }
    
    func getMultipleCharacters(ids: Int...) async throws -> [Character] {
        let url = URL(string: "\(baseUrl)/character/\(ids.map { String($0) }.joined(separator: ","))")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode([Character].self, from: data)
        
        return decoded
    }
    
    func filterCharacters(
        name: String? = nil,
        status: Character.Status? = nil,
        species: String? = nil,
        type: String? = nil,
        gender: Character.Gender? = nil,
        page: Int = 1
    ) async throws -> ResponseInfo<Character> {
        let url = URL(string: "\(baseUrl)/character")!.appending(queryItems: [
            URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "status", value: status?.rawValue.lowercased()),
            URLQueryItem(name: "species", value: species),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "gender", value: gender?.rawValue.lowercased()),
            URLQueryItem(name: "page", value: String(page)),
        ].filter { $0.value != nil })
        
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
