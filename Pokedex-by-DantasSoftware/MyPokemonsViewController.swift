//
//  MyPokemonsViewController.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 25/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class MyPokemonsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemonName = [String]()
    var pokemonId = [Int]()
    var pokemon: Pokemon!
    var addButton: UIButton!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
       

        
    }

 
    



    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyPokemons", forIndexPath: indexPath) as? MyPokemonsCell {
            
            
           
            let names = pokemonName[indexPath.row]
            let ids = String(pokemonId[indexPath.row])
            cell.mainIMG.image = UIImage(named: ids)
            cell.mainLabel.text = names
            
        
            
            
            return cell
        } else {
            
            return UICollectionViewCell()
        }
        
    }



    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pokemonId.count
        
        
        
    }



    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }


    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 105)
        
    }
   

    @IBAction func backButton(sender: AnyObject) {
        for id in pokemonId {
            
            if id == self.pokemon.pokedexId {
                addButton.enabled = false
                
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
