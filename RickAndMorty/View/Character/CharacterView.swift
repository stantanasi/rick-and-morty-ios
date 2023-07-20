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
            Section(
                header: Text("Appearance"),
                content: {
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: viewModel.character?.image ?? ""))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Spacer()
                    }
                }
            )
        }
        .navigationTitle(viewModel.character?.name ?? "Loading...")
        .listStyle(GroupedListStyle())
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
