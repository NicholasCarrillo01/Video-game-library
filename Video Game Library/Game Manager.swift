//
//  Game Manager.swift
//  Video Game Library
//
//  Created by Nichilas Carrillo on 7/26/18.
//  Copyright © 2018 Ryan Brashear. All rights reserved.
//

import Foundation

class GameManager {
    //this class will be in charge of managing our list of games
    
    //this will be the instance of the gamemanager class that we use throughout our application
    static let sharedInstance = GameManager()
    
    
    private init() {
    let game1 = Game(title: "GTAV", genre: "Action")
    let game2 = Game(title: "Forza Horizon", genre: "Racing")
    let game3 = Game(title: "Red Dead", genre: "Action")
        
        games.append(game1)
        games.append(game2)
        games.append(game3)
    }
    //our array of games
    private var games: [Game] = []
    
    func addGame(game: Game) {
        games.append(game)
    }
   
    func getGame(at index: Int) -> Game {
        return games[index]
    }
    
    //funtion to remmote a game at an index
    func removeGame(at index: Int) {
        games.remove(at: index)
    }
    
    func checkGameInOrOut(at index: Int) {
        let game = games[index]
        
        game.availablility = !game.availablility
    }
   
    
    //function to get the number of games in the array
    func getGameCount() -> Int {
        return games.count
    }

    
    
    


}














