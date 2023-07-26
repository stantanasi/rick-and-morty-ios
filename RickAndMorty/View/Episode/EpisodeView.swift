//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import SwiftUI

struct EpisodeView: View {
    
    @ObservedObject private var viewModel: EpisodeViewModel
    
    init(id: Int) {
        viewModel = EpisodeViewModel(id: id)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(id: 1)
    }
}
