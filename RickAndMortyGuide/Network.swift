//
//  Network.swift
//  RickAndMortyGuide
//
//  Created by Andrey Sandler on 19.07.2024.
//

import Foundation

let url = URL(string: "https://rickandmortyapi.com/api/character")
let request = URLRequest(url: url!)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    print("\(String(describing: data))")
}


