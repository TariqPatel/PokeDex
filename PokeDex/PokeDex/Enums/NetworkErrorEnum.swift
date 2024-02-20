//
//  NetworkErrorEnum.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/20.
//

import Foundation

enum NetworkError: Error {
    
    case error(error: String)
    case dataInvalid
    case responseInvalid
    case errorDecoding(error: String)
}
