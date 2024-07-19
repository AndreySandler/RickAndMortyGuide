//
//  CharacterDetails.swift
//  RickAndMortyGuide
//
//  Created by Andrey Sandler on 19.07.2024.
//

import SwiftUI

struct CharacterDetails: View {
    let result: Character
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: result.image)) { phase in
                phase.image?
                    .resizable()
                    .clipShape(.rect(cornerRadius: 10))
            }
            Text("\(result.status)")
            Text("\(result.description)")
        }
        .navigationTitle("\(result.name)")
    }
}

