//
//  CharacterRow.swift
//  RickAndMortyGuide
//
//  Created by Andrey Sandler on 19.07.2024.
//

import SwiftUI

struct CharacterRow: View {
    let result: Character
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: result.image)) { phase in
                phase.image?
                    .resizable()
                    .frame(width: 84, height: 64)
                    .clipShape(.rect(cornerRadius: 10))
            }
            VStack(alignment: .leading, spacing: 7) {
                Text("\(result.name)")
                    .font(.custom("IBM Plex Sans", size: 18))
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
                HStack {
                    Text("\(result.status)")
                    Text("• \(result.species)")
                        .padding(-5)
                }
                Text("\(result.gender)")
            }
            .font(.custom("IBM Plex Sans", size: 12))
            Spacer()
        }
        .frame(width: 320, height: 64)
    }
}

