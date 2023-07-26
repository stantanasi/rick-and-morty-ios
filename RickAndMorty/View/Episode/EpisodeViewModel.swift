//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import Foundation

class EpisodeViewModel: ObservableObject {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @Published public var episode: Episode?
    
    init(id: Int) {
        getEpisode(id: id)
    }
    
    
    func getEpisode(id: Int) {
        Task {
            let response = try! await rickAndMortyApi.getSingleEpisode(id: id)
            DispatchQueue.main.async {
                self.episode = response
            }
        }
    }
}
