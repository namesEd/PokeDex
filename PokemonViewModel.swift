//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Edward Kyles on 8/6/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    let service = PokeDexService()
    @Published var pokemon = [Pokemon]()
    @Published var pokemonDetail: PokemonDetail?

    
    @MainActor func getPokemon() {
        Task {
            do {
                let pokemonList = try await service.fetchPokemon()
                self.pokemon = pokemonList.results
            } catch {
                throw APIError.decodingError
            }
        }
    }
    
    @MainActor func getPokemonDetail(url: String) {
        Task {
            do {
                let detail = try await service.fetchPokemonDetail(url: url)
                self.pokemonDetail = detail
            } catch {
                print(error)
            }
        }
    }
    
}

