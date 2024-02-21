//
//  PokeDetailViewModel.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import Foundation

final class PokeDetailViewModel: ObservableObject {
    @Published var pokemon: Pokemon
    @Published var pokemonURL: String
    
    init(pokemon: Pokemon = Pokemon(), pokemonURL: String = "") {
        self.pokemon = pokemon
        self.pokemonURL = pokemonURL
    }
}
