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
    @Published var pokemonDescription: String = ""
    
    init(pokemon: Pokemon = Pokemon(), pokemonURL: String = "") {
        self.pokemon = pokemon
        self.pokemonURL = pokemonURL
    }
    
    func getPokeDetails() {
        let pokeID = Helper.getPokemonID(url: pokemonURL)
        let characteristicURL = "https://pokeapi.co/api/v2/characteristic/\(pokeID)/"
        
        guard let url = URL(string: characteristicURL) else {return}
        NetworkService<Pokemon>.fetchData(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        var description =  response.descriptions?.filter( { $0.language.name.contains("en") } )
                        self.pokemonDescription = description?.first?.description ?? "Could not find description"
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
