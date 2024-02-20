//
//  PokeListView.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/20.
//

import SwiftUI

struct PokeListView: View {
    
    @StateObject var pokeListViewModel = PokeListViewModel()
    
    var body: some View {
        VStack {
            List(pokeListViewModel.pokemonList, id: \.name) { pokemon in
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
    }
}

#Preview {
    PokeListView()
}
