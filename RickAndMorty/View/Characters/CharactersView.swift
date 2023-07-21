//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 20/07/2023.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters, id: \.id) { character in
                    NavigationLink(
                        destination: CharacterView(id: character.id),
                        label: {
                            Text(character.name)
                        }
                    )
                }
                
                if !viewModel.characters.isEmpty && viewModel.currentPage < viewModel.totalPages {
                    HStack {
                        Spacer()
                        VStack {
                            ProgressView()
                            Text("Loading next page...")
                        }
                        Spacer()
                    }
                    .onAppear {
                        viewModel.getCharacters(page: viewModel.currentPage + 1)
                    }
                }
            }
            .navigationTitle("Characters")
            .listStyle(GroupedListStyle())
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
