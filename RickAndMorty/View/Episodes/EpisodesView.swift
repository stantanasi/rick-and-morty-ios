//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import SwiftUI

struct EpisodesView: View {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @State private var episodes: [Episode] = []
    @State private var currentPage = 1
    @State private var totalPages = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(episodes, id: \.id) { episode in
                    NavigationLink(
                        destination: EpisodeView(id: episode.id),
                        label: {
                            Text(episode.name)
                        }
                    )
                }
                
                if !episodes.isEmpty && currentPage < totalPages {
                    HStack {
                        Spacer()
                        VStack {
                            ProgressView()
                            Text("Loading next page...")
                        }
                        Spacer()
                    }
                    .task {
                        let response = try! await rickAndMortyApi.getAllEpisodes(page: self.currentPage + 1)
                        self.episodes.append(contentsOf: response.results)
                        self.currentPage += 1
                        self.totalPages = response.info.pages
                    }
                }
            }
            .navigationTitle("Episodes")
            .listStyle(GroupedListStyle())
            .task {
                let response = try! await rickAndMortyApi.getAllEpisodes()
                self.episodes = response.results
                self.totalPages = response.info.pages
            }
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}
