//
//  Pokemon.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 17/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _weight: Int!
    private var _height: Int!
    private var _speed: Int!
    private var _spAttack: Int!
    private var _spDefense: Int!
    private var _defense: Int!
    private var _attack: Int!
    private var _hp: Int!
    private var _type: Int!
    private var _description: Int!
    private var _evolutionName: Int!
    private var _EvolutionLv: Int!
    
    
    
    
    
    var name: String {
        return _name
    }
    
    
    var pokedexId: Int {
        return _pokedexId
    }


    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
    }




}