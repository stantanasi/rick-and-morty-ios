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
            
            if let character = viewModel.character {
                infoSection(character)
            }
        }
        .navigationTitle(viewModel.character?.name ?? "Loading...")
        .listStyle(GroupedListStyle())
        .task {
            await viewModel.getCharacter(id: self.id)
        }
    }
    
    private func infoSection(_ character: Character) -> some View {
        Section(
            header: Text("Info"),
            content: {
                if !character.species.isEmpty {
                    HStack {
                        Text("Species")
                        Spacer()
                        Text(character.species)
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                }
                if !character.type.isEmpty {
                    HStack {
                        Text("Type")
                        Spacer()
                        Text(character.type)
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                }
                if !character.gender.rawValue.isEmpty {
                    HStack {
                        Text("Gender")
                        Spacer()
                        Text(character.gender.rawValue)
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                }
                if !character.status.rawValue.isEmpty {
                    HStack {
                        Text("Status")
                        Spacer()
                        Text(character.status.rawValue)
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                }
                if !character.location.name.isEmpty {
                    HStack {
                        Text("Location")
                        Spacer()
                        Text(character.location.name)
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                }
                if !character.origin.name.isEmpty {
                    HStack {
                        Text("Origin")
                        Spacer()
                        Text(character.origin.name)
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                }
            }
        )
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(id: 1)
    }
}
