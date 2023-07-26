//
//  LocationView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import SwiftUI

struct LocationView: View {
    
    @ObservedObject private var viewModel: LocationViewModel
    
    init(id: Int) {
        viewModel = LocationViewModel(id: id)
    }
    
    var body: some View {
        List {
            if let location = viewModel.location {
                infoSection(location)
            }
        }
        .navigationTitle(viewModel.location?.name ?? "Loading...")
        .listStyle(GroupedListStyle())
    }
    
    
    private func infoSection(_ location: Location) -> some View {
        Section(
            header: Text("Info"),
            content: {
                HStack {
                    Text("Type")
                    Spacer()
                    Text(location.type)
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                }
                HStack {
                    Text("Dimension")
                    Spacer()
                    Text(location.dimension)
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                }
            }
        )
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(id: 1)
    }
}
