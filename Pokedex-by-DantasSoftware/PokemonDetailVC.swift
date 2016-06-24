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
    @IBOutlet weak var segment: UISegmentedControl!
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
        idLabel.text = "#\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetails {
            self.updateUI()
          
        }
     
    }
  
    func updateUI() {
        
        desLabel.text = pokemon.description
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        speedLabel.text = pokemon.speed
        spAtkLabel.text = pokemon.spAttack
        spDefLabel.text = pokemon.spDefense
        defenseLabel.text = pokemon.defense
        attackLabel.text = pokemon.attack
        hpLabel.text = pokemon.hp
        typeLabel.text = pokemon.type
        evolutionLvLabel.text = pokemon.evolutionLv
        evolutionNameLabel.text = pokemon.evolutionName
        evolutionImg.image = UIImage.gifWithName(String(pokemon.nextEvolutionId))
        
        if pokemon.nextEvolutionId == "" {
            
            evolutionNameLabel.text = "No Evolution"
            evolutionImg.hidden = true
            evolutionLvLabel.text = "-"
            
        }
      
    }
  
    
    @IBAction func backButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
   
    }
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        
        switch segment.selectedSegmentIndex {
        case 1:
            performSegueWithIdentifier("Moves", sender: nil)
        default:
            break
            
        }
    }



    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Moves" {
            if let movesVC = segue.destinationViewController as? MovesViewController {
                movesVC.pokemonMoveName = self.pokemon.moveName
                movesVC.pokemonMoveDescription = self.pokemon.movesDescription
                movesVC.pokemonMoveLevel = self.pokemon.moveLevel
                movesVC.pokemonMoveAccurancy = self.pokemon.moveAccurancy
                movesVC.pokemonMovePower = self.pokemon.movePower
                movesVC.pokemonMovePP = self.pokemon.movePP
                movesVC.segment = self.segment
                
            }
        }
        
    }

}
