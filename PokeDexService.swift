//
//  PokeDexService.swift
//  PokeDex
//
//  Created by Edward Kyles on 8/6/23.
//

import Foundation

class PokeDexService {
    let urlString = "https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0"
    
    func fetchPokemon() async throws -> PokemonList {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonList.self, from: data)
    }
    
    //let urlStringDetailed = "https://pokeapi.co/api/v2/pokemon/\(number.self)/"
    
    func fetchPokemonDetail(url: String) async throws -> PokemonDetail {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PokemonDetail.self, from: data)
    }

    
}


