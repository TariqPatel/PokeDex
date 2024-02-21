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
            Text("Tariq")
            .navigationTitle("Pokemon name here")
        }.task {
            pokeDetailViewModel.getPokeDetails()
        }
        
    }
}

#Preview {
    PokeDetailView()
}
