//
//  PokeDetailView.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import SwiftUI

struct PokeDetailView: View {
    
    @StateObject var pokeDetailViewModel = PokeDetailViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(pokeDetailViewModel.pokeList.name?.capitalized ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                PokeImage(pokeImageURL: Helper.getPokeImage(url: pokeDetailViewModel.pokeList.url ?? ""))
                VStack(alignment: .leading, spacing: 16) {
                    HStack{
                        Text("Highest Stat:").bold()
                        Spacer()
                        Text(pokeDetailViewModel.pokeHighestStat.capitalized)
                    }
                    HStack{
                        Text("Personality:").bold()
                        Spacer()
                        Text(pokeDetailViewModel.pokemonDescription)
                    }
                    .font(.body)
                    Spacer()
                }
                .padding(50)
                Spacer()
            }
        }.task {
            pokeDetailViewModel.getPokeDetails()
        }
    }
}

#Preview {
    PokeDetailView()
}
