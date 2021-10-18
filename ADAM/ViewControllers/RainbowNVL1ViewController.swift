//
//  RainbowNVL1ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class RainbowNVL1ViewController: UIViewController {
    
    @IBOutlet weak var btnOption1R1: UIButton!
    @IBOutlet weak var btnOption2R1: UIButton!
    @IBOutlet weak var btnOption3R1: UIButton!
    @IBOutlet weak var ivLife3R1: UIImageView!
    @IBOutlet weak var ivLife2R1: UIImageView!
    @IBOutlet weak var ivLife1R1: UIImageView!
    @IBOutlet weak var lblScoreR1: UILabel!
    @IBOutlet weak var lblColorR1: UILabel!
    
    let modelRainbowNVL1 = RainbowModelNVL1()
    var newhigh = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setLayoutAtributes()
        
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let score = modelRainbowNVL1.score
        let destinationVC = segue.destination as? GameOverViewController
        destinationVC?.score = score
        
    }
    
    @IBAction func pauseArcLevel1(_ sender: Any) {
        performSegue(withIdentifier: "pauseArcoiris1", sender: nil)
    }
    
    
    @IBAction func clickOption1(_ sender: UIButton) {
        modelRainbowNVL1.checkAnswer(answer: 0)
        lblScoreR1.text = "Puntaje: " + String(modelRainbowNVL1.score)
        checkLives()
        setLayoutAtributes()
    
    }
    @IBAction func clickOption2(_ sender: UIButton) {
        modelRainbowNVL1.checkAnswer(answer: 1)
        lblScoreR1.text = "Puntaje: " + String(modelRainbowNVL1.score)
        checkLives()
        setLayoutAtributes()
    }
    @IBAction func clickOption3(_ sender: UIButton) {
        modelRainbowNVL1.checkAnswer(answer: 2)
        lblScoreR1.text = "Puntaje: " + String(modelRainbowNVL1.score)
        checkLives()
        setLayoutAtributes()
    }
    
    func setLayoutAtributes() {
        modelRainbowNVL1.gameRound()
        lblColorR1.text = modelRainbowNVL1.colorText
        lblColorR1.textColor = modelRainbowNVL1.colorValue
        btnOption1R1.setImage(modelRainbowNVL1.imageView1, for: .normal)
        btnOption2R1.setImage(modelRainbowNVL1.imageView2, for: .normal)
        btnOption3R1.setImage(modelRainbowNVL1.imageView3, for: .normal)
    }

    
    func checkLives() {
        if modelRainbowNVL1.globalLives == 2 {
            ivLife3R1.image = UIImage(named:"34")
        }
        if (modelRainbowNVL1.globalLives == 1) {
            ivLife2R1.image = UIImage(named:"34")
        }
        if (modelRainbowNVL1.globalLives == 0) {
            ivLife1R1.image = UIImage(named:"34")
            btnOption1R1.isEnabled = false
            btnOption2R1.isEnabled = false
            btnOption3R1.isEnabled = false
            let user = ModelManager.instance.findCurrentUSer()
            if user.scoreR < modelRainbowNVL1.score {
                ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: modelRainbowNVL1.score, game: 0)
            }
            performSegue(withIdentifier: "toGOR1", sender: nil)
        }
    }
    
    
    
}
