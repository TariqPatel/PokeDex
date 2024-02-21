//
//  PokeImage.swift
//  PokeDex
//
//  Created by Tasneem Patel on 2024/02/21.
//

import SwiftUI

struct PokeImage: View {
    
    @State var pokeImageURL: String
    @Environment(\.displayScale) var scale
        let size: CGFloat = 100
    
    var body: some View {
        AsyncImage(url: URL(string: pokeImageURL),
                           scale: 3) { phase in
                    switch phase {
                        case .empty:
                            ZStack {
                                Color.gray
                                ProgressView()
                            }
                        case .success(let image):
                            image.resizable()
                        case .failure(_):
                            Text("Image not available.")
                        @unknown default:
                            Text("Image not available.")
                    }
                }
                .frame(width: size, height: size)
    }
}

#Preview {
    PokeImage(pokeImageURL: "")
}
