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
        if gameForIndex.availablility {
            cell.availabilityLabel.text = "Available"
            cell.availabilityLabel.backgroundColor = BackgroundColors.checkedInGreen
        } else {
            cell.availabilityLabel.text = "Checked out"
            cell.availabilityLabel.backgroundColor = BackgroundColors.checkedOutOrange
        }
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete") { (_ , _ ) in
        GameManager.sharedInstance.removeGame(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let game = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = game.availablility ? "Check Out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { (_ , _) in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadData()
        }
        
        
        return [deleteAction, checkOutOrInAction]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    struct BackgroundColors {
        static let checkedInGreen = UIColor(hex: "2ECC71")
        static let checkedOutOrange = UIColor(hex: "F5AB35")
    }

}

//Extension to the UIColor class to allow us to easily use Hex values to create new UIColor instances
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}











