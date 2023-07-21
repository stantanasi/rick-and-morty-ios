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