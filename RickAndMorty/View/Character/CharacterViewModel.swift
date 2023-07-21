//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 20/07/2023.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    private let rickAndMortyApi = RickAndMortyApi()
    @Published public var character: Character?
    
    func getCharacter(id: Int) async {
        let response = try! await rickAndMortyApi.getSingleCharacter(id: id)
        DispatchQueue.main.async {
            self.character = response
        }
    }
}
