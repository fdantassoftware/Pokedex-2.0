//
//  ViewController.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 16/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemon = [Pokemon]()
    var mPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        parsePokemonCSV()
        initAudio()
        
        
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
            
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            return cell
            
            
        } else {
            
            return UICollectionViewCell()
        }
        
    }


 

    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.pokemon.count
    }



    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
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



}

