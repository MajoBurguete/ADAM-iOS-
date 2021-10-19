/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit

//Clase creada para la modificacion de los elementos visuales del juego "Arcoiris" en la dificultad intermedia, asi como el llamado del modelo de este juego
class RainbowNVL2ViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    @IBOutlet weak var btnOption1R2: UIButton!
    @IBOutlet weak var btnOption2R2: UIButton!
    @IBOutlet weak var btnOption3R2: UIButton!
    @IBOutlet weak var btnOption4R2: UIButton!
    @IBOutlet weak var ivLife3R2: UIImageView!
    @IBOutlet weak var ivLife2R2: UIImageView!
    @IBOutlet weak var ivLife1R2: UIImageView!
    @IBOutlet weak var lblScoreR2: UILabel!
    @IBOutlet weak var lblColorR2: UILabel!
    var newHigh = false
    let modelRainbowNVL2 = RainbowModelNVL2()
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        //Se llama al método "setLayoutAttributes" para actualizar los valores del Layout conforme a los datos del modelo
        setLayoutAtributes()
    }
    
    //se manda la puntuacion a la pantalla de gameOver para poder desplegarla para el usuario
    override func prepare(for segue:     UIStoryboardSegue, sender: Any?) {
        let game = "arcoiris"
        let score = modelRainbowNVL2.score
        let destinationVC = segue.destination as? GameOverViewController
        destinationVC?.score = score
        destinationVC?.newHigh = newHigh
        destinationVC?.game = game
    }

    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption1(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 0)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()

    }
    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption2(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 1)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()
    }
    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption3(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 2)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()
    }
    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption4(_ sender: UIButton) {
        modelRainbowNVL2.checkAnswer(answer: 3)
      lblScoreR2.text = "Puntaje: " + String(modelRainbowNVL2.score)
      checkLives()
      setLayoutAtributes()
    }

    /*El método "setLayoutAttributes" llama a "gameRound" del modelo para actualizar sus atributos y poder reflejarlos en el view*/
    func setLayoutAtributes() {
        modelRainbowNVL2.gameRound()
        lblColorR2.text = modelRainbowNVL2.colorText
        lblColorR2.textColor = modelRainbowNVL2.colorValue
        btnOption1R2.setImage(modelRainbowNVL2.imageView1, for: .normal)
        btnOption2R2.setImage(modelRainbowNVL2.imageView2, for: .normal)
        btnOption3R2.setImage(modelRainbowNVL2.imageView3, for: .normal)
        btnOption4R2.setImage(modelRainbowNVL2.imageView4, for: .normal)
    }


    //El método "checkLives" revisa el valor de las vidas en el modelo para hacer los cambios oportunos en las imagenes de vidas, asi como deshabilitas los botones al llegar a 0 y mandarlo a el View de gameOver y guardar su nuevo score si este fue mayor a su record personal
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
                newHigh = true
                ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: modelRainbowNVL2.score, game: 0)
            }
            performSegue(withIdentifier: "toGOR2", sender: nil)
        }
    }

    //boton de pausa
    @IBAction func pauseArcLevel2(_ sender: Any) {
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let titleAttrString = NSMutableAttributedString(string: "Pausa", attributes: titleFont)
        let alert = UIAlertController(title: "Pausa", message: nil, preferredStyle: .actionSheet)
        alert.setValue(titleAttrString, forKey:"attributedTitle")
        let returnAction = UIAlertAction(title: "Seguir Jugando", style: .cancel) {
            (_) in }
        let exitAction = UIAlertAction(title: "Salir", style: .destructive) {action in
            self.performSegue(withIdentifier: "toHomeR2", sender: nil)
        }
        alert.addAction(returnAction)
        alert.addAction(exitAction)
        present(alert, animated: true, completion: nil)
    }
    
}
