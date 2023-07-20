//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 20/07/2023.
//

import SwiftUI

struct CharacterView: View {
    
    @StateObject private var viewModel = CharacterViewModel()
    private var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        List {
        }
        .navigationTitle(viewModel.character?.name ?? "Loading...")
        .task {
            await viewModel.getCharacter(id: self.id)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(id: 1)
    }
}
