//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import SwiftUI

struct LocationsView: View {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @State private var locations: [Location] = []
    @State private var currentPage = 1
    @State private var totalPages = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locations, id: \.id) { location in
                    NavigationLink(
                        destination: LocationView(id: location.id),
                        label: {
                            Text(location.name)
                        }
                    )
                }
                
                if !locations.isEmpty && currentPage < totalPages {
                    HStack {
                        Spacer()
                        VStack {
                            ProgressView()
                            Text("Loading next page...")
                        }
                        Spacer()
                    }
                    .task {
                        let response = try! await rickAndMortyApi.getAllLocations(page: self.currentPage + 1)
                        self.locations.append(contentsOf: response.results)
                        self.currentPage += 1
                        self.totalPages = response.info.pages
                    }
                }
            }
            .navigationTitle("Locations")
            .listStyle(GroupedListStyle())
            .task {
                let response = try! await rickAndMortyApi.getAllLocations()
                self.locations = response.results
                self.totalPages = response.info.pages
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
