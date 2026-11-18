//
//  Player.swift
//  TennisTests
//
//  Created by PedroRamos on 18/11/2026.
//

struct Player {
    var name: String
    var score: Int
    
    init(_ name: String, score: Int = 0) {
        self.name = name
        self.score = score
    }
}
