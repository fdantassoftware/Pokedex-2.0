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
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        nameLabel.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
    
    
    
}
