//
//  MovesViewController.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 24/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class MovesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var pokemonMoveName = [String]()
    var pokemonMoveDescription = [String]()
    var pokemonMoveLevel = [String]()
    var pokemonMoveAccurancy = [String]()
    var pokemonMovePower = [String]()
    var pokemonMovePP = [String]()
    var segment: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(pokemonMoveName.count)
    
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovesCell") as? MovesCell {
         
            cell.moveName.text = pokemonMoveName[indexPath.row]
            cell.detail.text = pokemonMoveDescription[indexPath.row]
            cell.moveLevel.text = pokemonMoveLevel[indexPath.row]
            cell.accuracy.text = pokemonMoveAccurancy[indexPath.row]
            cell.power.text = pokemonMovePower[indexPath.row]
            cell.pp.text = pokemonMovePP[indexPath.row]
         
        
            return cell
        } else {
            
            return MovesCell()
        }
        
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     
        return pokemonMoveName.count
      
    }


    @IBAction func backButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        self.segment.selectedSegmentIndex = 0
    }

  
}
