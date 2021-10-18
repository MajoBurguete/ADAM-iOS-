//
//  RainbowNVL2ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class RainbowNVL2ViewController: UIViewController {
    @IBOutlet weak var btnOption1R2: UIButton!
    @IBOutlet weak var btnOption2R2: UIButton!
    @IBOutlet weak var btnOption3R2: UIButton!
    @IBOutlet weak var btnOption4R2: UIButton!
    @IBOutlet weak var ivLife3R2: UIImageView!
    @IBOutlet weak var ivLife2R2: UIImageView!
    @IBOutlet weak var ivLife1R2: UIImageView!
    @IBOutlet weak var lblScoreR2: UILabel!
    @IBOutlet weak var lblColorR2: UILabel!

    let modelRainbowNVL2 = RainbowModelNVL2()

    override func viewDidLoad() {
      
      super.viewDidLoad()
      setLayoutAtributes()
      
    }

    override func prepare(for segue:     UIStoryboardSegue, sender: Any?) {
         let score = modelRainbowNVL2.score
         let destinationVC = segue.destination as? GameOverViewController
        destinationVC?.score = score
      
    }

    @IBAction func clickOption1(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 0)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()

    }
    @IBAction func clickOption2(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 1)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()
    }
    @IBAction func clickOption3(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 2)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()
    }
    @IBAction func clickOption4(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 3)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()
    }

    func setLayoutAtributes() {
        modelRainbowNVL2.gameRound()
        lblColorR2.text = modelRainbowNVL2.colorText
        lblColorR2.textColor = modelRainbowNVL2.colorValue
        btnOption1R2.setImage(modelRainbowNVL2.imageView1, for: .normal)
        btnOption2R2.setImage(modelRainbowNVL2.imageView2, for: .normal)
        btnOption3R2.setImage(modelRainbowNVL2.imageView3, for: .normal)
        btnOption4R2.setImage(modelRainbowNVL2.imageView4, for: .normal)
    }


    func checkLives() {
        if modelRainbowNVL2.globalLives == 2 {
            ivLife3R2.image = UIImage(named:"34")
        }
        if (modelRainbowNVL2.globalLives == 1) {
            ivLife2R2.image = UIImage(named:"34")
        }
        if (modelRainbowNVL2.globalLives == 0) {
            ivLife1R2.image = UIImage(named:"34")
            btnOption1R2.isEnabled = false
            btnOption2R2.isEnabled = false
            btnOption3R2.isEnabled = false
            btnOption4R2.isEnabled = false
            let user = ModelManager.instance.findCurrentUSer()
            if user.scoreR < modelRainbowNVL2.score {
                ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: modelRainbowNVL2.score, game: 0)
            }
            performSegue(withIdentifier: "toGOR2", sender: nil)
        }
    }


    @IBAction func pauseArcLevel2(_ sender: Any) {
        performSegue(withIdentifier: "pauseArcoiris2", sender: nil)
    }
    
}
