//
//  RainbowNVL1ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class RainbowNVL1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func pauseArcLevel1(_ sender: Any) {
        performSegue(withIdentifier: "pauseArcoiris1", sender: nil)
    }
    
    
}
