//
//  CharacterDetails.swift
//  RickAndMortyGuide
//
//  Created by Andrey Sandler on 19.07.2024.
//

import SwiftUI

struct CharacterDetails: View {
    @State  var result: Character
    @State var characterEpisode: [Episode]
    
    var body: some View {
        List {
            VStack {
                VStack(alignment: .center) {
                    AsyncImage(url: URL(string: result.image)) { phase in
                        phase.image?
                            .resizable()
                            .frame(width: 320, height: 320)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    ZStack {
                        if result.status == "Alive" {
                            Color.green
                        } else if result.status == "Dead" {
                            Color.red
                        } else {
                            Color.gray
                        }
                        Text(result.status.firstCharUpper())
                            .frame(width: 320, height: 32)
                    }
                    .clipShape(.rect(cornerRadius: 30))
                    .frame(width: 320, height: 42)
                }
                .frame(width: 320, height: 374)
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 5) {
                        let episodeName = characterEpisode.map { $0.name }
                        let string = episodeName.joined(separator: ", ")
                        Text("Species: \(result.species)")
                        Text("Gender: \(result.gender)")
                        Text("Episode: \(string)").lineSpacing(5)
                        Text("Location: \(result.location.name)")
                    }
                    .scrollIndicators(.hidden)
                    .frame(width: 320, height: .infinity, alignment: .leading)
                }
                .scrollIndicators(.hidden)
                .frame(width: 320, height: 136)
            }
            .frame(width: 320, height: 502)
        }
        .scrollIndicators(.hidden)
        .navigationTitle(result.name)
        .font(.custom("IBM Plex Sans", size: 16))
        .task {
            await LoadData()
        }
    }
    func LoadData() async {
        for episode in result.episode {
            guard let url = URL(string: episode) else {
                print("Invalid url")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                if let decodedResponse = try? JSONDecoder().decode(Episode.self, from: data) {
                    characterEpisode.append(decodedResponse)
                }
            } catch {
                print("Invalid data")
            }
        }
    }
}
    
#Preview {
    ContentView()
}
