//
//  PokeListModel.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/20.
//

import Foundation

struct PokeListResponse: Codable {
    var count: Int
    var next: String
    var previous: String
    var results: PokeList
}

struct PokeList: Codable {
    var name: String
    var url: String
}
