//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import SwiftUI

struct EpisodeView: View {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    private let id: Int
    @State private var episode: Episode?
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        List {
            if let episode = episode {
                infoSection(episode)
            }
        }
        .navigationTitle(episode?.name ?? "Loading...")
        .listStyle(GroupedListStyle())
        .task {
            let response = try! await rickAndMortyApi.getSingleEpisode(id: self.id)
            self.episode = response
        }
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
