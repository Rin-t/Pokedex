//
//  PokemonDataStore.swift
//  Pokedex
//
//  Created by Rin on 2024/03/31.
//

import Foundation


struct PokemonDataStore {

    enum Error: Swift.Error {
        case failToFetchData
        case failToCreateUrl
    }

    private let endPoint = "https://pokeapi.co/api/v2/pokemon/"

    func fetchPokemonList(from startId: PokemonId, to endId: PokemonId) async throws -> [PokemonEntity] {
        do {
            let urls = createUrls(from: startId.value, to: endId.value)
            var pokemons: [PokemonEntity] = try await NetworkService.fetchDataList(urls: urls)
            return pokemons.sorted { $0.id < $1.id }
        } catch {
            throw Error.failToFetchData
        }
    }

    private func createUrls(from startId: Int, to endId: Int) -> [URL] {
        var urls: [URL] = []
        for i in startId...endId {
            let url = URL(string: endPoint + String(i))!
            urls.append(url)
        }
        return urls
    }
}


