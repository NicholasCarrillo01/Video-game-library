//
//  TableViewCell.swift
//  Video Game Library
//
//  Created by Nichilas Carrillo on 7/26/18.
//  Copyright © 2018 Ryan Brashear. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameGenreLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
