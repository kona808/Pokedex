//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jacob Perez on 10/7/22.
//

import Foundation

enum Keys: Any {
    case name: "name"
    case id: "id"
    case height: "height"
    case moves: ["moves"]
    case abilities: ["ablities"]
}


class Pokemon {
    // This is tha data I want to capture
    let name: String
    let id: Int
    let spritePath: String
    let height: Int
    let moves: [String]
    let abilities: [String]
    
    init(name: String, id: Int, spritePath: String, height: Int, moves: [String], abilities: [String]) {
        self.name = name
        self.id = id
        self.spritePath = spritePath
        self.height = height
        self.moves = moves
        self.abilities = abilities
    }
}

extension Pokemon {
    // First level first
    convenience init?(topLevelDictionary: [String: Any]) {
        guard let name = topLevelDictionary[name] as? [String: Any],
              let id = topLevelDictionary[id] as? [String: Any],
              let height = topLevelDictionary[height] as? [String: Any],
              let moves = topLevelDictionary[moves] as? [String: Any],
              let abilities = topLevelDictionary[abilities as?] else { return nil }
        
        // Temp Abilities Array
        var tempAbilitiesArray: [String] = []
        // Second level deep
        for abilityDictionary in abilitiesArray {
            guard let deeperAbilityDictionary = abilityDictionary[abilities]
        }
    }
}
