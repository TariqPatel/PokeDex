//
//  PokeListView.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/20.
//

import SwiftUI

struct PokeListView: View {
    
    @StateObject var pokeListViewModel = PokeListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(searchResults, id: \.name) { pokemon in
                    HStack {
                        Text(pokemon.name.capitalized)
                        Spacer()
                        PokeImage(pokeImageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
                    }
                }
            }
        }.searchable(text: $searchText).task {
            pokeListViewModel.viewPokemon()
        }
    }
    
    var searchResults: [PokeList] {
        if searchText.isEmpty {
            return pokeListViewModel.pokemonList
        } else {
            return pokeListViewModel.pokemonList.filter( { $0.name.contains(searchText.lowercased()) } )
        }
    }
}

#Preview {
    PokeListView()
}
