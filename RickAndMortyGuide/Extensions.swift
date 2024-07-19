//
//  Extensions.swift
//  RickAndMortyGuide
//
//  Created by Andrey Sandler on 19.07.2024.
//

import Foundation

extension String {
    // MARK: - Увеличивает первый символ в строке
    func firstCharUpper() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }
}


