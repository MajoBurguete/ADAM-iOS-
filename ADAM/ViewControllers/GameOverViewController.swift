//
//  GameOverViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 16/10/21.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var score = 0
    var game = ""
    
    @IBOutlet weak var lblNewHighCuento: UILabel!
    @IBOutlet weak var tvScoreCuento: UILabel!
    
    
    @IBOutlet weak var lblNewHighArcoiris: UILabel!
    @IBOutlet weak var tvScoreArcoiris: UILabel!
    
    @IBOutlet weak var lblNewHighFormitas: UILabel!
    @IBOutlet weak var tvScoreFormitas: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if game == "cuento" {
            tvScoreCuento.text = String(score)
        }
        if game == "arcoiris" {
            tvScoreCuento.text = String(score)
        }
        if game == "formitas" {
            tvScoreCuento.text = String(score)
        }     
    }
    
    @IBOutlet weak var lblScoreGOR: UILabel!
    
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
