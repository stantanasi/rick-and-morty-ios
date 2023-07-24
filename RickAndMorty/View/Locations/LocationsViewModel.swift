//
//  LocationsViewModel.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @Published public var locations: [Location] = []
    
    init() {
        getLocations()
    }
    
    
    func getLocations(page: Int = 1) {
        Task {
            let response = try! await rickAndMortyApi.getAllLocations(page: page)
            DispatchQueue.main.async {
                self.locations.append(contentsOf: response.results)
            }
        }
    }
}
