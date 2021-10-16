//
//  StoryViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class StoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func pauseStoryS(_ sender: Any) {
        performSegue(withIdentifier: "pauseCuentoS", sender: nil)
    }
    
    
   
    @IBAction func pauseStoryQ(_ sender: Any) {
        performSegue(withIdentifier: "pauseCuentoQ", sender: nil)
    }
    
    
}
