//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import Foundation

class EpisodesViewModel: ObservableObject {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @Published public var episodes: [Episode] = []
    
    init() {
        getEpisodes()
    }
    
    
    func getEpisodes(page: Int = 1) {
        Task {
            let response = try! await rickAndMortyApi.getAllEpisodes(page: page)
            DispatchQueue.main.async {
                self.episodes.append(contentsOf: response.results)
            }
        }
    }
}
