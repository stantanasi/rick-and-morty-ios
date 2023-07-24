//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 10/07/2023.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CharactersView()
                    .tabItem {
                        Label("Characters", systemImage: "person.crop.square.fill.and.at.rectangle")
                    }
                EpisodesView()
                    .tabItem {
                        Label("Episodes", systemImage: "tv")
                    }
            }
        }
    }
}
