//
//  Pokemon.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 17/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _weight: String!
    private var _height: String!
    private var _speed: String!
    private var _spAttack: String!
    private var _spDefense: String!
    private var _defense: String!
    private var _attack: String!
    private var _hp: String!
    private var _type: String!
    private var _description: String!
    private var _EvolutionName: String!
    private var _EvolutionLv: String!
    private var _pokemonUrl: String!
    private var _nextEvolutionId: String!
  
    
    // Hiding Data
    
    var name: String {
        
        
        return _name
        
    }
  
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        
        return _weight
        
        
    }
    
    var height: String {
        
        if _height == nil {
            _height = ""
        }
        
        return _height
        
    }
    
 
    
    var speed: String {
        if _speed == nil {
            _speed = ""
        }
        
        return _speed
    }
    

    var spAttack: String {
        if _spAttack == nil {
            _spAttack = ""
        }
        
        return  _spAttack
    }
    
  
    
    var spDefense: String {
        if _spDefense == nil {
            _spDefense = ""
        }
        
        return _spDefense
    }
    
 
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        
        return _defense
    }
    
  
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        
        return _attack
    }
    
  
    
    var hp: String {
        if _hp == nil {
            _hp = ""
            
        }
        
        return _hp
    }
    
  
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        
        return _type
    }
    
 
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        
        return _description
    }
    
 
    
    var evolutionName: String {
        if _EvolutionName == nil {
            _EvolutionName = ""
        }
        return _EvolutionName
    }
    
 
    
    var evolutionLv: String {
        if _EvolutionLv == nil {
            _EvolutionLv = ""
        }
        
        return _EvolutionLv
    }
    

    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        
        return _nextEvolutionId
    }
    

    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
  
    
    // Mark: Download and Parse Data
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: self._pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { (response) in
            
            if let dic = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dic["weight"] as? String {
                    let convertedWeight = Double(weight)! * 0.1
                    self._weight = "\(convertedWeight) Kg"
                }
                
                if let height = dic["height"] as? String {
                    let convertedHeight = Double(height)! * 0.1
                    self._height = "\(convertedHeight) m"
                }
                
                if let attack = dic["attack"] as? Int {
                    self._attack = String(attack)
                }
                
                
                if let defense = dic["defense"] as? Int {
                    self._defense = String(defense)
                }
                
                if let speed = dic["speed"] as? Int {
                    self._speed = String(speed)
                }
                
                if let sp_Atk = dic["sp_atk"] as? Int {
                    self._spAttack = String(sp_Atk)
                }
                
                if let sp_Def = dic["sp_def"] as? Int {
                    self._spDefense = String(sp_Def)
                }
                
                if let hp = dic["hp"] as? Int {
                    self._hp = String(hp)
                }
                
                if let types = dic["types"] as? [String:String] {
                    print(types.debugDescription)
                    
                }
                
                
                if let types = dic["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1 ..< types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                    
                }
                
                
                if let descArray = dic["descriptions"] as? [Dictionary<String, AnyObject>] where descArray.count > 0 {
                    
                    if let url = descArray[0]["resource_uri"] as? String {
                        
                        let nurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nurl).responseJSON(completionHandler: { (response) in
                            
                            if let descDic = response.result.value as? Dictionary<String, AnyObject> {
                                if let description = descDic["description"] as? String {
                                    self._description = description
                                    print(self._description)
                                }
                            }
                          
                            completed()
                        
                        })
                     
                    }
                    
                    
                } else {
                    
                    self._description = ""
                }
                
                if let evolutions = dic["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                  
                    if let to = evolutions[0]["to"] as? String {
                        
                     
                        // Cannot support mega pokemons but APi still has mega Data
                        
                        if to.rangeOfString("mega") == nil {
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                
                                let newString = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let number = newString.stringByReplacingOccurrencesOfString("/", withString: "")
                                self._nextEvolutionId = number
                                
                                if let method = evolutions[0]["method"] as? String {
                                    
                                    if method != "level_up" {
                                        self._EvolutionLv = "Lv - \(method)"
                                        self._EvolutionName = to
                                    
                                    } else {
                                        
                                        if let lv = evolutions[0]["level"] as? Int {
                                            self._EvolutionLv = "Lv - \(lv)"
                                            self._EvolutionName = to
                                            
                                        }
                                    }
                                }
                          
                            }
                        }
                        
                    }
                 
                }
                
            }
            
        }
        
    }
    
}