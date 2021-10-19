//
//  StoryViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class StoryViewController: UIViewController {
    
    let model1 = StoryModelNVL1.instance
    let model2and3 = StoryModelNVL2And3.instance
    
    @IBOutlet weak var tvStory: UITextView!
    
    @IBOutlet weak var btnContinue: UIButton!
    
    var difficulty = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StoryModelNVL1.instance.clearModel()
        StoryModelNVL2And3.instance.clearModel()
        /*Justo al iniciar el View Controller se llama al método generateParagraph del modelo en curso, que varía de acuerdo a la dificultad*/
        if (difficulty == 1) {
            self.tvStory.attributedText = model1.generateParagraph()
        }
        else {
            self.tvStory.attributedText = model2and3.generateParagraph(difficulty: difficulty)
        }
        
    }
    
    /*Se crea la funcinalidad del botón de pausa, desplegando un view controller en modalidad Show detail*/
    @IBAction func pauseStoryS(_ sender: Any) {
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let titleAttrString = NSMutableAttributedString(string: "Pausa", attributes: titleFont)
        let alert = UIAlertController(title: "Pausa", message: nil, preferredStyle: .actionSheet)
        alert.setValue(titleAttrString, forKey:"attributedTitle")
        let returnAction = UIAlertAction(title: "Seguir Jugando", style: .cancel) {
            (_) in }
        let exitAction = UIAlertAction(title: "Salir", style: .destructive) {action in
            self.performSegue(withIdentifier: "toHomeC1", sender: nil)
        }
        alert.addAction(returnAction)
        alert.addAction(exitAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Se envia la dificultad como parametro a la case StoryQuestionViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StoryQuestionViewController {
            let vc = segue.destination as? StoryQuestionViewController
            vc?.difficulty = difficulty
        }
    }
    
    //Se crea la funcionalidad del botón "Continuar", que cambia dependiendo del nivel de dificultad
    @IBAction func btnContinue(_ sender: Any) {
        /*Debido a que el nivel "fácil" solo presenta una pregunta, el botón continuar directamente hace los cambios necesarios en el Layout para pasar a la sección de preguntas*/
        if difficulty == 1 {
            performSegue(withIdentifier: "showStoryQ", sender: nil)
        }
        /*En caso de ser nivel "intermedio" o "dificil", se checa el número actual de la párrafo, pues deben presentarse 3 antes de pasar a la sección de preguntas*/
        else {
            if model2and3.actualParagraph <= 2 {
                //Se modifica el texto con la pregunta actual del modelo
                self.tvStory.scrollRangeToVisible(NSRange(location: 0, length: 0))
                self.tvStory.attributedText = model2and3.generateParagraph(difficulty: difficulty)
            }
            else {
                performSegue(withIdentifier: "showStoryQ", sender: nil)
            }
        }
    }
    
    
}
