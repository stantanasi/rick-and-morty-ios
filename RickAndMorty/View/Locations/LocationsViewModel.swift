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
    public var currentPage = 1
    public var totalPages = 0
    
    init() {
        getLocations()
    }
    
    
    func getLocations(page: Int = 1) {
        Task {
            let response = try! await rickAndMortyApi.getAllLocations(page: page)
            DispatchQueue.main.async {
                self.locations.append(contentsOf: response.results)
                self.currentPage = page
                self.totalPages = response.info.pages
            }
        }
    }
}
