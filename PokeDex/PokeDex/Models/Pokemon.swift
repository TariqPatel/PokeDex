//
//  Pokemon.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import Foundation

struct Pokemon: Codable {
    var id: Int?
    var gene_modulo: Int?
    var possible_values: [Int]?
    var highest_stat: HighestStat?
    var descriptions: [PokemonDescriptions]?
}

struct HighestStat: Codable {
    var name: String
    var url: String
}

struct PokemonDescriptions: Codable {
    var description: String
    var language: PokemonLanguage
}

struct PokemonLanguage: Codable {
    var name: String
    var url: String
}
