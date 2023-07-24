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
    public var currentPage = 1
    public var totalPages = 0
    
    init() {
        getEpisodes()
    }
    
    
    func getEpisodes(page: Int = 1) {
        Task {
            let response = try! await rickAndMortyApi.getAllEpisodes(page: page)
            DispatchQueue.main.async {
                self.episodes.append(contentsOf: response.results)
                self.currentPage = page
                self.totalPages = response.info.pages
            }
        }
    }
}
