//
//  MyPokemonsViewController.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 25/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class MyPokemonsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemonName = [String]()
    var pokemonId = [Int]()
    var pokemon: Pokemon!
    var addButton: UIButton!
    var fetchedResultsController: NSFetchedResultsController!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        initializefetchedResultsController()
   
    }

    
    override func viewDidAppear(animated: Bool) {
        
        collectionView.reloadData()
        
        
    }
    
    
    func initializefetchedResultsController() {
        
        let request = NSFetchRequest(entityName: "Pokemons")
        let sortDescriptors = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptors]
        
        
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        
        do {
            
            try fetchedResultsController.performFetch()
        } catch {
            
            fatalError("Failed to inialize\(error)")
        }
        
        
    }
    


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyPokemons", forIndexPath: indexPath) as? MyPokemonsCell {
            
            let pokemon = fetchedResultsController.objectAtIndexPath(indexPath) as! Pokemons
            cell.mainIMG.image = UIImage(data: pokemon.image!)
            cell.mainLabel.text = "#\(pokemon.id!) \(pokemon.name!.capitalizedString)"
         
      
            return cell
        } else {
            
            return UICollectionViewCell()
        }
        
    }



    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sections = fetchedResultsController.sections as [NSFetchedResultsSectionInfo]!
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
        
        
        
    }



    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return fetchedResultsController.sections!.count
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
