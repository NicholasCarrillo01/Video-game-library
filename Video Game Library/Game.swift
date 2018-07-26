//
//  Game.swift
//  Video Game Library
//
//  Created by Ryan Brashear on 7/25/18.
//  Copyright © 2018 Ryan Brashear. All rights reserved.
//

import Foundation

class Game {
    /*
    Add four properties for this class:
        * title, which is a String
        * genre, which is a String
        * availability, which is a Bool
        * dueDate, which is a Date
    */
    var title: String
    var genre: String
    var availablility: Bool = true
    var dueDate: Date!
    
    /*
    Create the initializer for this class.
    */
    init(title: String, genre: String) {
        self.title = title
        self.genre = genre
    }
}
