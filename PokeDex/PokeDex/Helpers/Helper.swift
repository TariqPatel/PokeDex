//
//  ImageHelper.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import Foundation
import SwiftUI

struct Helper {
    
    static func getPokeImage(url: String) -> String {
        
        let result = url.components(separatedBy:  "/")
                                .flatMap { [$0, "/"] }
                                .dropLast()
                                .filter { $0 != "" }
        return Constants.Strings.pokemonSpriteUrl + result[result.count - 2] + ".png"
    }
    
    static func getPokemonID(url: String) -> String {
        
        let result = url.components(separatedBy:  "/")
                                .flatMap { [$0, "/"] }
                                .dropLast()
                                .filter { $0 != "" }
        return  result[result.count - 2]
    }
}
