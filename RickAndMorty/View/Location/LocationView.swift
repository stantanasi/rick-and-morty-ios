//
//  LocationView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 26/07/2023.
//

import SwiftUI

struct LocationView: View {
    
    @ObservedObject private var viewModel: LocationViewModel
    
    init(id: Int) {
        viewModel = LocationViewModel(id: id)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(id: 1)
    }
}
