//
//  Episode.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 24/07/2023.
//

import Foundation

struct Episode: Decodable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
