//
//  AddGameViewController.swift
//  Video Game Library
//
//  Created by Nichilas Carrillo on 7/27/18.
//  Copyright © 2018 Ryan Brashear. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var genrePicker: UIPickerView!
    
    let genre = ["RPG", "FPS", "Racing", "Racing", "Strategy"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func displayErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "New games must have a title", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let gameTitle = titleTextField.text, gameTitle != "" else {
            displayErrorAlert()
            return
        }
    
    let selectedGenreRow = genrePicker.selectedRow(inComponent: 0)
        let selectedGenre = genre[selectedGenreRow]
        
    let newGame = Game(title: gameTitle, genre: selectedGenre)
        
        GameManager.sharedInstance.addGame(game: newGame)
    self.performSegue(withIdentifier: "unwindToGameLibrary", sender: self)
    
    }
    
}
