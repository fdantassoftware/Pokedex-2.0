//
//  PokeCell.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 17/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        
    }
    
    
    // Custom Cell
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        if String(pokemon.pokedexId).characters.count == 1 {
            
            nameLabel.text = "#00\(self.pokemon.pokedexId) \(self.pokemon.name)"
        
        } else if String(pokemon.pokedexId).characters.count == 2 {
            
            nameLabel.text = "#0\(self.pokemon.pokedexId) \(self.pokemon.name)"
            
        } else {
            
            nameLabel.text = "#\(self.pokemon.pokedexId) \(self.pokemon.name)"
          
        }
        
       thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    
    }
 
}
