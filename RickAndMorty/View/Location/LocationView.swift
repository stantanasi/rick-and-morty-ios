//
//  LocationView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import SwiftUI

struct LocationView: View {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    private let id: Int
    @State private var location: Location?
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        List {
            if let location = location {
                infoSection(location)
            }
        }
        .navigationTitle(location?.name ?? "Loading...")
        .listStyle(GroupedListStyle())
        .task {
            let response = try! await rickAndMortyApi.getSingleLocation(id: self.id)
            self.location = response
        }
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
