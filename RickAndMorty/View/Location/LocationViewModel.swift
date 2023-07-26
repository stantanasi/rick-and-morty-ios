//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @Published public var location: Location?
    
    init(id: Int) {
        getLocation(id: id)
    }
    
    
    func getLocation(id: Int) {
        Task {
            let response = try! await rickAndMortyApi.getSingleLocation(id: id)
            DispatchQueue.main.async {
                self.location = response
            }
        }
    }
}
