//
//  ViewController.swift
//  Video Game Library
//
//  Created by Ryan Brashear on 7/25/18.
//  Copyright © 2018 Ryan Brashear. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell") as! GameTableViewCell
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        cell.gameTitleLabel.text = gameForIndex.title
        cell.gameGenreLabel.text = gameForIndex.genre
        return cell
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

