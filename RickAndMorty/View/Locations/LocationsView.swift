//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import SwiftUI

struct LocationsView: View {
    
    @ObservedObject private var viewModel = LocationsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.locations, id: \.id) { location in
                    Text(location.name)
                }
                
                if !viewModel.locations.isEmpty && viewModel.currentPage < viewModel.totalPages {
                    HStack {
                        Spacer()
                        VStack {
                            ProgressView()
                            Text("Loading next page...")
                        }
                        Spacer()
                    }
                    .onAppear {
                        viewModel.getLocations(page: viewModel.currentPage + 1)
                    }
                }
            }
            .navigationTitle("Locations")
            .listStyle(GroupedListStyle())
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
