//
//  PokeDexModel.swift
//  PokeDex
//
//  Created by Edward Kyles on 8/6/23.
//

import Foundation

struct PokemonList: Codable, Identifiable {
    let id = UUID()
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
    
    var number: String {
            let urlComponents = url.split(separator: "/")
            guard let lastComponent = urlComponents.last, !lastComponent.isEmpty else {
                return "Unknown"
            }
            return String(lastComponent)
        }
}

struct PokemonAbility: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

struct PokemonAbilityDetail: Codable {
    let ability: PokemonAbility
    let is_hidden: Bool
    let slot: Int
}

struct PokemonDetail: Codable {
    let abilities: [PokemonAbilityDetail]
}

