//
//  ContentView.swift
//  RickAndMortyGuide
//
//  Created by Andrey Sandler on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Character]()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.preferredFont(forTextStyle: .extraLargeTitle2)]
    }
    
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { result in
                NavigationLink(destination: CharacterDetails(result: result)) {
                    CharacterRow(result: result)
                }
            }
            .navigationTitle("Rick & Morty Characters ")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
            .listRowSpacing(5)
            .task {
                await LoadData()
            }
        }
    }
    func LoadData() async {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(RickAndMorty.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}

