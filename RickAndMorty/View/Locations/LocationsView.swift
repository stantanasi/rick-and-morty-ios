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
