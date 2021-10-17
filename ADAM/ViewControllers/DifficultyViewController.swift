//
//  ViewDifficulty.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 05/10/21.
//

import UIKit

class DifficultyViewController: UIViewController {
    
    var difficultyStory = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    @IBAction func backFromCuento(_ sender: Any) {
        performSegue(withIdentifier: "showHome", sender: nil)
    }
    
    @IBAction func backFromArcoiris(_ sender: Any) {
        performSegue(withIdentifier: "showHomeArc", sender: nil)
    }
    
    
    
    @IBAction func backFromFormitas(_ sender: Any) {
        performSegue(withIdentifier: "showHomeForm", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StoryViewController {
            let vc = segue.destination as? StoryViewController
            vc?.difficulty = difficultyStory
        }
    }
    
    
    @IBAction func easyLevelStory(_ sender: Any) {
        difficultyStory = 1
        performSegue(withIdentifier: "startStoryGame", sender: nil)
    }
    
    
    @IBAction func mediumLevelStory(_ sender: Any) {
        difficultyStory = 2
        performSegue(withIdentifier: "startStoryGame", sender: nil)
    }
    
    
    @IBAction func hardLevelStory(_ sender: Any) {
        difficultyStory = 3
        performSegue(withIdentifier: "startStoryGame", sender: nil)
    }
    

}
