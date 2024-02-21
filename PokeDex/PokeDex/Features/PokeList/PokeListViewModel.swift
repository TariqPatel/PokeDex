//
//  PokeListViewModel.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/20.
//

import Foundation

final class PokeListViewModel: ObservableObject {
    @Published var pokemonList: [PokeList] = [PokeList]()
    
    func viewPokemon() {
        guard let url = URL(string: Constants.Strings.pokemonListUrl) else {return}
        NetworkService<PokeListResponse>.fetchData(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.pokemonList = response.results
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
