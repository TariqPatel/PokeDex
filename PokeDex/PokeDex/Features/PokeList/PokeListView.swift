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
    let baseURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
    @Environment(\.displayScale) var scale
        let size: CGFloat = 100
    
    var body: some View {
        NavigationStack {
            VStack {
                List(searchResults, id: \.name) { pokemon in
                    HStack {
                        Text(pokemon.name.capitalized)
                    Spacer()
                    AsyncImage(url: URL(string: baseURLString),
                                       scale: 3) { phase in
                                switch phase {
                                    case .empty:
                                        ZStack {
                                            Color.gray
                                            ProgressView()
                                        }
                                    case .success(let image):
                                        image.resizable()
                                    case .failure(let error):
                                        Text(error.localizedDescription)
                                        // use placeholder for production app
                                    @unknown default:
                                        EmptyView()
                                }
                            }
                            .frame(width: size, height: size)
                    }
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
