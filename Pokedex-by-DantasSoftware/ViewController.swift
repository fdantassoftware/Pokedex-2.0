//
//  ViewController.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 16/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemon = [Pokemon]()
    var mPlayer: AVAudioPlayer!
    var inSearchMode = false
    var filteredPokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        parsePokemonCSV()
        initAudio()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
    }

  
    func parsePokemonCSV() {
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]
                let poke = Pokemon(name: name!, pokedexId: pokeId)
                pokemon.append(poke)
                
                
                
                
                
              
            
                
                
                
            }
        
        } catch {
            
            print(error)
        }
            
            
            
        
        
        
        
        
    }

    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let poke: Pokemon!
            if inSearchMode {
                
                poke = filteredPokemon[indexPath.row]
                
            } else {
                poke = pokemon[indexPath.row]
                
                
            }
            
            
            cell.configureCell(poke)
            return cell
            
            
        } else {
            
            return UICollectionViewCell()
        }
        
    }


 

    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredPokemon.count
        } else {
            return pokemon.count
        }
        
        
    }



    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }


    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let poke: Pokemon!
        if inSearchMode {
            
            poke = filteredPokemon[indexPath.row]
        } else {
            
            poke = pokemon[indexPath.row]
        }
    
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
    
    }



    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 105)
    }



    @IBAction func musicPressed(sender: UIButton!) {
        
        if mPlayer.playing {
            mPlayer.stop()
            sender.alpha = 0.2
            
        } else {
            mPlayer.play()
            sender.alpha = 1.0
        }
        
        
    }

    
    func initAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "mp3")
        do {
            mPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path!)!)
            mPlayer.prepareToPlay()
            mPlayer.numberOfLoops = -1
            mPlayer.play()
        
        } catch {
            
            print(error)
        }
    }


    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            collectionView.reloadData()
            
        }
    }







    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        view.endEditing(true)
        
    }


    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        view.endEditing(true)
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PokemonDetailVC" {
            if let detailsVC = segue.destinationViewController as? PokemonDetailVC {
                if let poke = sender as? Pokemon {
                    detailsVC.pokemon = poke
                }
                
            }
        }
    }


}

