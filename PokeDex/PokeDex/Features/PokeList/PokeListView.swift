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
        NavigationView {
            VStack {
                List(searchResults, id: \.name) { pokemon in
                    NavigationLink(destination: PokeDetailView(pokeListViewModel: PokeDetailViewModel(pokemonURL: pokemon.url))) {
                        HStack {
                            Text(pokemon.name.capitalized).bold()
                            Spacer()
                            PokeImage(pokeImageURL: ImageHelper.getPokeImage(url: pokemon.url))
                        }
                    }
                }
            }
            .navigationTitle("Whos that Pokemon!")
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
