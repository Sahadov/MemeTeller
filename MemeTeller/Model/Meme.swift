//
//  Meme.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import Foundation

struct Meme: Codable, Hashable {
    let id: String
    let name: String
    let url: String
}

struct APIResponse: Codable, Hashable {
    let success: Bool
    let data: Memes
}

struct Memes: Codable, Hashable {
    let memes: [Meme]
}

