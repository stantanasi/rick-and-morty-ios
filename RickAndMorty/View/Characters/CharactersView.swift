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
            List(viewModel.characters) { character in
                Text(character.name)
            }
            .navigationTitle("Characters")
            .task {
                await viewModel.getCharacters()
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
