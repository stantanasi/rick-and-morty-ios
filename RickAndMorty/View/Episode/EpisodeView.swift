//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import SwiftUI

struct EpisodeView: View {
    
    @ObservedObject private var viewModel: EpisodeViewModel
    
    init(id: Int) {
        viewModel = EpisodeViewModel(id: id)
    }
    
    var body: some View {
        List {
            if let episode = viewModel.episode {
                infoSection(episode)
            }
        }
        .navigationTitle(viewModel.episode?.name ?? "Loading...")
        .listStyle(GroupedListStyle())
    }
    
    
    private func infoSection(_ episode: Episode) -> some View {
        Section(
            header: Text("Info"),
            content: {
                HStack {
                    Text("Air date")
                    Spacer()
                    Text(episode.air_date)
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                }
                HStack {
                    Text("Code")
                    Spacer()
                    Text(episode.episode)
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                }
            }
        )
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(id: 1)
    }
}
