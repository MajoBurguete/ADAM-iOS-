//
//  RainbowNVL2ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class RainbowNVL2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func pauseArcLevel2(_ sender: Any) {
        performSegue(withIdentifier: "pauseArcoiris2", sender: nil)
    }
    
}
