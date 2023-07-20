//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Lory-Stan TANASI on 20/07/2023.
//

import SwiftUI

struct CharacterView: View {
    
    private var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(id: 1)
    }
}
