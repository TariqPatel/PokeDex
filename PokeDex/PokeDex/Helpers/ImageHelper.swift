//
//  ImageHelper.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import Foundation
import SwiftUI

struct ImageHelper {
    
    static func getPokeImage(url: String) -> String {
        let basePokeImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        let result = url.components(separatedBy:  "/")
                                .flatMap { [$0, "/"] }
                                .dropLast()
                                .filter { $0 != "" }
        return basePokeImageURL + result[result.count - 2] + ".png"
    }
}
