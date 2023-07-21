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
    public var currentPage = 1
    public var totalPages = 0
    
    init() {
        getCharacters()
    }
    
    
    func getCharacters(page: Int = 1) {
        Task {
            let response = try! await rickAndMortyApi.getAllCharacters(page: page)
            DispatchQueue.main.async {
                self.characters.append(contentsOf: response.results)
                self.currentPage = page
                self.totalPages = response.info.pages
            }
        }
    }
}
