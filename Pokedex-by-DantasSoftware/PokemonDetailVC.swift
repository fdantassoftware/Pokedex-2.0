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

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var evolutionImg: UIImageView!
    @IBOutlet weak var desImg: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var evolutionLvLabel: UILabel!
    @IBOutlet weak var evolutionNameLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var spAtkLabel: UILabel!
    @IBOutlet weak var spDefLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonName.text = pokemon.name.capitalizedString
        desImg.image = UIImage.gifWithName(String(pokemon.pokedexId))
        evolutionImg.image = UIImage.gifWithName("2")
        
     
    }
  

    @IBAction func backButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
            
        
    }

}
