//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 20/07/2023.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    private let rickAndMortyApi = RickAndMortyApi()
    @Published public var characters: [Character] = []
    
    func getCharacters() async {
        let response = try! await rickAndMortyApi.getAllCharacters()
        DispatchQueue.main.async {
            self.characters.append(contentsOf: response.results)
        }
    }
}
