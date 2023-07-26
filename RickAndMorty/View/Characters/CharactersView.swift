//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 20/07/2023.
//

import SwiftUI

struct CharactersView: View {
    
    private let rickAndMortyApi = RickAndMortyApi()
    
    @State private var characters: [Character] = []
    @State private var currentPage = 1
    @State private var totalPages = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(characters, id: \.id) { character in
                    NavigationLink(
                        destination: CharacterView(id: character.id),
                        label: {
                            Text(character.name)
                        }
                    )
                }
                
                if !characters.isEmpty && currentPage < totalPages {
                    HStack {
                        Spacer()
                        VStack {
                            ProgressView()
                            Text("Loading next page...")
                        }
                        Spacer()
                    }
                    .task {
                        let response = try! await rickAndMortyApi.getAllCharacters(page: currentPage + 1)
                        self.characters.append(contentsOf: response.results)
                        self.currentPage = currentPage + 1
                        self.totalPages = response.info.pages
                    }
                }
            }
            .navigationTitle("Characters")
            .listStyle(GroupedListStyle())
            .task {
                let response = try! await rickAndMortyApi.getAllCharacters()
                self.characters = response.results
                self.totalPages = response.info.pages
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
