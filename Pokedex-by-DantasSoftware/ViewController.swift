//
//  ViewController.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 16/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }

  


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let pokemon = Pokemon(name: "Pikachu", pokedexId: indexPath.row)
            cell.configureCell(pokemon)
            return cell
            
            
        } else {
            
            return UICollectionViewCell()
        }
        
    }


 

    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 718
    }



    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }





    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 105)
    }



}

