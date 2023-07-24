//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject private var viewModel = EpisodesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.episodes, id: \.id) { episode in
                    Text(episode.name)
                }
            }
            .navigationTitle("Episodes")
            .listStyle(GroupedListStyle())
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}
