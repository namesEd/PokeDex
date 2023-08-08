//
//  ContentView.swift
//  PokeDex
//
//  Created by Edward Kyles on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemon, id: \.id) { poke in
                NavigationLink(destination: PokemonDetailView(pokemon: poke, viewModel: viewModel)) {
                    PokemonRow(pokemon: poke)
                }
            }
            .navigationTitle("PokéDex")
            .onAppear() {
                viewModel.getPokemon()
            }
        }
    }
}

struct PokemonRow: View {
    var pokemon: Pokemon

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://img.pokemondb.net/artwork/large/\(pokemon.name).jpg")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView() 
            }
            .frame(width: 100, height: 100)

            VStack(alignment: .leading, spacing: 2) {
                Text(pokemon.name)
                    .font(.title2)
                    .bold()
                Text("#\(pokemon.number)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}



struct PokemonDetailView: View {
    var pokemon: Pokemon
    @ObservedObject var viewModel: PokemonViewModel

    var body: some View {
        List(viewModel.pokemonDetail?.abilities ?? [], id: \.ability.id) { abilityDetail in
            Text(abilityDetail.ability.name)
            /*Text("\(abilityDetail.ability.name)
                 - \(abilityDetail.is_hidden ? "Hidden" : "Visible")") */
        }
        .navigationTitle(pokemon.name)
        .onAppear {
            viewModel.getPokemonDetail(url: pokemon.url)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
