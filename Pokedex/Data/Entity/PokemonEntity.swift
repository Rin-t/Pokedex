//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by Rin on 2024/03/31.
//

import Foundation

struct PokemonId {
    let value: Int
    init(value: Int) {
        if !(1...151 ~= value) {
            fatalError("1~151までの数字を入れること")
        }
        self.value = value
    }
}

struct PokemonEntity: Decodable {
    let id: String
    let name: String
}
