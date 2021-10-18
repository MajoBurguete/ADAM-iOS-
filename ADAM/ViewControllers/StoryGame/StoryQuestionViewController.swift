/*Esta clase representa el Controlador para los 3 diferentes niveles del juego "Te Cuento un Cuento"*/


import UIKit

class StoryQuestionViewController: UIViewController {
    
    //Se instancian todas las variables necesarias para el sistema del Controlador
    
    let model1 = StoryModelNVL1.instance
    let model2and3 = StoryModelNVL2And3.instance
    @IBOutlet weak var ivLife1S: UIImageView!
    @IBOutlet weak var ivLife2S: UIImageView!
    @IBOutlet weak var ivLife3S: UIImageView!
    @IBOutlet weak var tvQuestion: UITextView!
    @IBOutlet weak var tvScoreS: UILabel!
    @IBOutlet weak var tvResult: UILabel!
    @IBOutlet weak var btnNextQ: UIButton!
    @IBOutlet weak var btnFirstOption: UIButton!
    @IBOutlet weak var btnSecondOption: UIButton!
    @IBOutlet weak var btnThirdOption: UIButton!
        
    var lives = 3
    var difficulty = 0
    var score = 0
    var strScore: String!
    var newHigh = false
    let user = ModelManager.instance.findCurrentUSer()
    
    // Se envia la dificultad como parametro a la case StoryQuestionViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GameOverViewController {
            let vc = segue.destination as? GameOverViewController
            vc?.score = score
            vc?.newHigh = newHigh
            vc?.game = "cuento"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (difficulty == 1) {
            /*Se llama al método "generateQuestionAndAnswers() para actualizar los valores y modificar los elementos correspondientes del Layout con la primera pregunta*/
            model1.generateQuestionAndAnswer()
            tvQuestion.text = model1.question
            btnFirstOption.setAttributedTitle(toAttributed(text: model1.firstAnsOption.uppercased()), for: .normal)
            btnSecondOption.setAttributedTitle(toAttributed(text: model1.secondAnsOption.uppercased()), for: .normal)
            btnThirdOption.setAttributedTitle(toAttributed(text: model1.thirdAnsOption.uppercased()), for: .normal)
            btnNextQ.isEnabled = false
            btnFirstOption.isEnabled = true
            btnSecondOption.isEnabled = true
            btnThirdOption.isEnabled = true
        }
        else {
            model2and3.generateQuestionAndAnswer()
            tvQuestion.text = model2and3.question
            btnFirstOption.setAttributedTitle(toAttributed(text: model2and3.firstAnsOption.uppercased()), for: .normal)
            btnSecondOption.setAttributedTitle(toAttributed(text: model2and3.secondAnsOption.uppercased()), for: .normal)
            btnThirdOption.setAttributedTitle(toAttributed(text: model2and3.thirdAnsOption.uppercased()), for: .normal)
            btnNextQ.isEnabled = false
            btnFirstOption.isEnabled = true
            btnSecondOption.isEnabled = true
            btnThirdOption.isEnabled = true
        }
        
        
    }
    
    /*El método "checkAnswer" recibe un entero como entrada, para evaluar si la respuesta seleccionada por el usuario corresponde o no con la respuesta a la pregunta actual*/
    
    func checkAnswer(option: Int) {
        var strResult = ""
        var btnOption1 = btnFirstOption
        var btnOption2 = btnSecondOption
        var btnOption3 = btnThirdOption
        
        /*Dependiendo del valor recibido, se declaran los valores de btnOption1, btnOption2 y btnOption3, con el fin de simplificar las referencias más adelante*/
        
        if option == 1 {
            btnOption1 = btnSecondOption
            btnOption2 = btnFirstOption
            btnOption3 = btnThirdOption
        }
        else if option == 2{
            btnOption1 = btnThirdOption
            btnOption2 = btnFirstOption
            btnOption3 = btnSecondOption
        }
        
        /*Para todos los niveles de dificultad, se compara la respuesta mandada por el input del usuario y se compara con los valores de respuesta establecidos por el modelo. En caso de coincidir, el texto del TextView muestra "¡Muy bien!, de no ser así, cambia a "¡Intenta de nuevo!"*/
        
        if difficulty == 1 {
            let currentTitleOP1 = btnOption1?.currentAttributedTitle?.string
            if model1.actualQuestion == 0 {
                if currentTitleOP1 == model1.firstAns.uppercased() {
                    strResult = "¡Muy bien!"
                } else {
                    strResult = "¡Intenta de nuevo!"
                }
            }
            if model1.actualQuestion == 1 {
                if currentTitleOP1 == model1.secondAns.uppercased() {
                    strResult = "¡Muy bien!"
                } else {
                    strResult = "¡Intenta de nuevo!"
                }
            }
            if model1.actualQuestion == 2 {
                if currentTitleOP1 == model1.thirdAns.uppercased() {
                    strResult = "¡Muy bien!"
                } else {
                    strResult = "¡Intenta de nuevo!"
                }
            }
        }
        else {
            let currentTitleOP1 = btnOption1?.currentAttributedTitle?.string
            if model2and3.actualQuestion == 0 {
                if currentTitleOP1 == model2and3.firstParagraphAns.uppercased() {
                    strResult = "¡Muy bien!"
                } else {
                    strResult = "¡Intenta de nuevo!"
                }
            }
            if model2and3.actualQuestion == 1 {
                if currentTitleOP1 == model2and3.secondParagraphAns.uppercased() {
                    strResult = "¡Muy bien!"
                } else {
                    strResult = "¡Intenta de nuevo!"
                }
            }
            if model2and3.actualQuestion == 2 {
                if currentTitleOP1 == model2and3.thirdParagraphAns.uppercased() {
                    strResult = "¡Muy bien!"
                } else {
                    strResult = "¡Intenta de nuevo!"
                }
            }
        }
        
        tvResult.text = strResult
        
        /*Si la respuesta fue correcta, se aumenta el valor de la puntuación, que incrementa dependiendo
        del número actual de vidas y el nivel de dificultad*/
        if(strResult == "¡Muy bien!"){
            score += lives * difficulty * 100
            tvScoreS.text = "Puntaje: " + String(score)
            
            /*Los colores de los botones de opciones se modifican, mostrando las incorrectas en rojo y la correcta en verde*/
            btnOption1?.backgroundColor = UIColor.verde
            btnOption2?.backgroundColor = UIColor.rojo
            btnOption3?.backgroundColor = UIColor.rojo
            
            //Los 3 botones se desabilitan para solo permitir pasar a la siguiente pregunta
            btnOption1?.isEnabled = false
            btnOption2?.isEnabled = false
            btnOption3?.isEnabled = false
            btnNextQ.isEnabled = true
            
            //El número de pregunta del modelo se aumenta en una unidad
            model1.actualQuestion = model1.actualQuestion + 1
            model2and3.actualQuestion = model2and3.actualQuestion + 1
            
        }
        //Si la respuesta fue incorrecta, se hace la modificación correspondiente de las vidas
        else{
            lives = lives - 1
            //Se checa el valor específico para cambiar el recurso de las las ImageViews
            if lives == 2 {
                ivLife3S.image = UIImage.init(named: "34")
            }
            if lives == 1 {
                ivLife2S.image = UIImage.init(named: "34")
            }
            /*Si el valor de las vidas llega a cero, además de cambiar el recurso, se hace la evaluación para mostrar la respuesta correcta*/
            if lives == 0 {
                ivLife1S.image = UIImage.init(named: "34")
                tvResult.text = "¡Juego terminado!"
                btnOption1?.isEnabled = false
                btnOption2?.isEnabled = false
                btnOption3?.isEnabled = false
                
                btnOption1?.backgroundColor = UIColor.rojo
                //Se checa la lógica para cada pregunta y las respuestas correctas existentes en el modelo
                if (difficulty == 1) {
                    let currentTitleOP2 = btnOption2?.currentAttributedTitle?.string
                    
                    if (model1.actualQuestion == 1) {
                        if (currentTitleOP2 == model1.secondAns.uppercased()) {
                            btnOption2?.backgroundColor = UIColor.verde
                            btnOption3?.backgroundColor = UIColor.rojo
                        }
                        else {
                            btnOption3?.backgroundColor = UIColor.verde
                            btnOption2?.backgroundColor = UIColor.rojo
                        }
                    }
                    else {
                        if (currentTitleOP2 == model1.thirdAns.uppercased()) {
                            btnOption2?.backgroundColor = UIColor.verde
                            btnOption3?.backgroundColor = UIColor.rojo
                        }
                        else {
                            btnOption3?.backgroundColor = UIColor.verde
                            btnOption2?.backgroundColor = UIColor.rojo
                        }
                    }
                    
                }
                else {
                    let currentTitleOP2 = btnOption2?.currentAttributedTitle?.string
                    
                    if model2and3.actualQuestion == 1 {
                        if (currentTitleOP2 == model2and3.secondParagraphAns.uppercased()) {
                            btnOption2?.backgroundColor = UIColor.verde
                            btnOption3?.backgroundColor = UIColor.rojo
                        }
                        else {
                            btnOption3?.backgroundColor = UIColor.verde
                            btnOption2?.backgroundColor = UIColor.rojo
                        }
                    }
                    else {
                        if (currentTitleOP2 == model2and3.thirdParagraphAns.uppercased()) {
                            btnOption2?.backgroundColor = UIColor.verde
                            btnOption3?.backgroundColor = UIColor.rojo
                        }
                        else {
                            btnOption3?.backgroundColor = UIColor.verde
                            btnOption2?.backgroundColor = UIColor.rojo
                        }
                    }
                }
                
                //Se habilita el botón de "Siguiente pregunta" para permitir la finalización de la partida
                btnNextQ.isEnabled = true
                
            }
            else {
                /*Si a pesar de equivocarse el usuario cuenta con vidas disponibles, solo de desabilita el botón de la opción marcada, evitando que pueda cometer el mismo error*/
                btnOption1?.isEnabled = false
            }
            
        }

        
        
        
    }
    
    /*La función toAttributed convierte un string convencional a uno con atributos para darle el formato adecuado*/
    func toAttributed(text: String) -> NSAttributedString {
        let textAtt = NSMutableAttributedString(string:text)
        let range = (textAtt.string as NSString).range(of: textAtt.string)
        textAtt.addAttribute(NSAttributedString.Key.font, value: UIFont.silkaL(size: 18), range: range)
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.right
        textAtt.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return textAtt
    }
    
    /*Se crea la funcinalidad del botón de pausa, desplegando un view controller en modalidad Show detail*/
    @IBAction func pauseStoryQ(_ sender: Any) {
        performSegue(withIdentifier: "pauseCuentoQ", sender: nil)
    }
    
    //Se crea la funcionalidad del botón "Siguiente pregunta", que cambia dependiendo del nivel de dificultad
    @IBAction func btnNextQ(_ sender: Any) {
        //Si el nivel de dificultad es "fácil" se trabaja con el modelo correspondiente
        if difficulty == 1 {
            //Se checa que el jugador aún cuente con vidas y no se haya llegado a la última pregunta de la partida
            if lives > 0 && model1.actualQuestion <= 2 {
                /*Se llama al método "generateQuestionAndAnswers() para actualizar los valores y modificar los elementos correspondientes del Layout*/
                model1.generateQuestionAndAnswer()
                tvResult.text = ""
                tvQuestion.text = model1.question
                btnFirstOption.setAttributedTitle(toAttributed(text: model1.firstAnsOption.uppercased()), for: .normal)
                btnSecondOption.setAttributedTitle(toAttributed(text: model1.secondAnsOption.uppercased()), for: .normal)
                btnThirdOption.setAttributedTitle(toAttributed(text: model1.thirdAnsOption.uppercased()), for: .normal)
                btnNextQ.isEnabled = false
                btnFirstOption.isEnabled = true
                btnSecondOption.isEnabled = true
                btnThirdOption.isEnabled = true
                btnFirstOption.backgroundColor = UIColor.verdePa
                btnSecondOption.backgroundColor = UIColor.naranja
                btnThirdOption.backgroundColor = UIColor.azul

            }
            else {
                /*En caso de haberse agotado las vidas o haber pasado la última pregunta, se obtienen los parámetros necesarios para poder hacer la evaluación de la Puntuación*/
                if user.scoreC < score {
                    newHigh = true
                    ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: score, game: 2)
                }
                performSegue(withIdentifier: "CuentoGameOver", sender: nil)
            }
        }
        //Si el nivel de dificultad es "intermedio" o "difícil" se trabaja con el modelo correspondiente
        else {
            if lives > 0 && model2and3.actualQuestion <= 2 {
                /*Se llama al método "generateQuestionAndAnswers() para actualizar los valores y modificar los elementos correspondientes del Layout*/
                model2and3.generateQuestionAndAnswer()
                tvResult.text = ""
                tvQuestion.scrollRangeToVisible(NSRange(location: 0, length: 0))
                tvQuestion.text = model2and3.question
                btnFirstOption.setAttributedTitle(toAttributed(text: model2and3.firstAnsOption.uppercased()), for: .normal)
                btnSecondOption.setAttributedTitle(toAttributed(text: model2and3.secondAnsOption.uppercased()), for: .normal)
                btnThirdOption.setAttributedTitle(toAttributed(text: model2and3.thirdAnsOption.uppercased()), for: .normal)
                btnNextQ.isEnabled = false
                btnFirstOption.isEnabled = true
                btnSecondOption.isEnabled = true
                btnThirdOption.isEnabled = true
                btnFirstOption.backgroundColor = UIColor.verdePa
                btnSecondOption.backgroundColor = UIColor.naranja
                btnThirdOption.backgroundColor = UIColor.azul

            }
            else {
                /*En caso de haberse agotado las vidas o haber pasado la última pregunta, se obtienen los parámetros necesarios para poder hacer la evaluación de la Puntuación*/
                if user.scoreC < score {
                    newHigh = true
                    ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: score, game: 2)
                }
                performSegue(withIdentifier: "CuentoGameOver", sender: nil)
            }
        }
    }
    
    /*Cada uno de los 3 botones disponibles para responder llama al método "checkAnswer" con el entero que le corresponde*/
    @IBAction func btnFirstOption(_ sender: Any) {
        checkAnswer(option: 0)
    }
    
    @IBAction func btnSecondOption(_ sender: Any) {
        checkAnswer(option: 1)
    }
    
    @IBAction func btnThirdOption(_ sender: Any) {
        checkAnswer(option: 2)
    }
    
    
}




