//
//  PokeDetailViewModel.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import Foundation

final class PokeDetailViewModel: ObservableObject {
    @Published var pokemon: Pokemon
    @Published var pokeList: PokeList
    @Published var pokemonDescription: String = ""
    @Published var pokeHighestStat: String = ""
    
    init(pokemon: Pokemon = Pokemon(), pokeList: PokeList = PokeList()) {
        self.pokemon = pokemon
        self.pokeList = pokeList
    }
    
    func getPokeDetails() {
        let pokeID = Helper.getPokemonID(url: pokeList.url ?? "")
        let characteristicURL = "https://pokeapi.co/api/v2/characteristic/\(pokeID)/"
        
        guard let url = URL(string: characteristicURL) else {return}
        NetworkService<Pokemon>.fetchData(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        var description =  response.descriptions?.filter( { $0.language.name.contains("en") } )
                        self.pokemonDescription = description?.first?.description ?? "Could not find description"
                        self.pokeHighestStat = response.highest_stat?.name ?? "Could not find stats"
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
