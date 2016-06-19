//
//  PokemonDetailVC.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 18/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit




class PokemonDetailVC: UIViewController {
    var pokemon: Pokemon!
    var image = [UIImage]()

    @IBOutlet weak var label: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        label.text = String(pokemon.pokedexId)
        
     
    }
  


}
