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
                    Text(pokemon.name)
                }
                Button(action: {
                    pokeListViewModel.viewPokemon()
                }) {
                    Text("Whos that POKEMON")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.white)
                }
            }
        }.searchable(text: $searchText)
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
