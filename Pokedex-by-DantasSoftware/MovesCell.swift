//
//  MovesCell.swift
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 24/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class MovesCell: UITableViewCell {
    @IBOutlet weak var moveLevel: UILabel!
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var accuracy: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var pp: UILabel!

    @IBOutlet weak var detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }


}
