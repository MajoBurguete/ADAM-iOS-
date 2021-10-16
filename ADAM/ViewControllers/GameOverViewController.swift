//
//  GameOverViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 16/10/21.
//

import UIKit

class GameOverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func playFormitasGO(_ sender: Any) {
        performSegue(withIdentifier: "playFormitasGO", sender: nil)
    }
    
    
    @IBAction func exitFormitasGO(_ sender: Any) {
        performSegue(withIdentifier: "backFormitasGO", sender: nil)
    }
    
    @IBAction func playArcoirisGO(_ sender: Any) {
        performSegue(withIdentifier: "playArcoirisGO", sender: nil)
    }
    
    @IBAction func exitArcoirisGO(_ sender: Any) {
        performSegue(withIdentifier: "backArcoirisGO", sender: nil)
    }
    
    
    @IBAction func playCuentoGO(_ sender: Any) {
        performSegue(withIdentifier: "playCuentoGO", sender: nil)
    }
    
    @IBAction func exitCuentoGO(_ sender: Any) {
        performSegue(withIdentifier: "backCuentoGO", sender: nil)
    }
    
}
