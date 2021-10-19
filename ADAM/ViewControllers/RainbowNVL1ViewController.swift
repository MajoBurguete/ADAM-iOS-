/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit

//Clase creada para la modificacion de los elementos visuales del juego "Arcoiris" en la dificultad facil, asi como el llamado del modelo de este juego
class RainbowNVL1ViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    @IBOutlet weak var btnOption1R1: UIButton!
    @IBOutlet weak var btnOption2R1: UIButton!
    @IBOutlet weak var btnOption3R1: UIButton!
    @IBOutlet weak var ivLife3R1: UIImageView!
    @IBOutlet weak var ivLife2R1: UIImageView!
    @IBOutlet weak var ivLife1R1: UIImageView!
    @IBOutlet weak var lblScoreR1: UILabel!
    @IBOutlet weak var lblColorR1: UILabel!
    let modelRainbowNVL1 = RainbowModelNVL1()
    var newHigh = false
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        //Se llama al método "setLayoutAttributes" para actualizar los valores del Layout conforme a los datos del modelo
        setLayoutAtributes()
    }
    
    //se manda la puntuacion a la pantalla de gameOver para poder desplegarla para el usuario
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let game = "arcoiris"
        let score = modelRainbowNVL1.score
        let destinationVC = segue.destination as? GameOverViewController
        destinationVC?.score = score
        destinationVC?.newHigh = newHigh
        destinationVC?.game = game
    }
    
    //boton de pausa
    @IBAction func pauseArcLevel1(_ sender: Any) {
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let titleAttrString = NSMutableAttributedString(string: "Pausa", attributes: titleFont)
        let alert = UIAlertController(title: "Pausa", message: nil, preferredStyle: .actionSheet)
        alert.setValue(titleAttrString, forKey:"attributedTitle")
        let returnAction = UIAlertAction(title: "Seguir Jugando", style: .cancel) {
            (_) in }
        let exitAction = UIAlertAction(title: "Salir", style: .destructive) {action in
            self.performSegue(withIdentifier: "toHomeR1", sender: nil)
        }
        alert.addAction(returnAction)
        alert.addAction(exitAction)
        present(alert, animated: true, completion: nil)
    }
    
    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption1(_ sender: UIButton) {
        modelRainbowNVL1.checkAnswer(answer: 0)
        lblScoreR1.text = "Puntaje: " + String(modelRainbowNVL1.score)
        checkLives()
        setLayoutAtributes()
    
    }
    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption2(_ sender: UIButton) {
        modelRainbowNVL1.checkAnswer(answer: 1)
        lblScoreR1.text = "Puntaje: " + String(modelRainbowNVL1.score)
        checkLives()
        setLayoutAtributes()
    }
    /*Cada boton que representa una opción de respuesta llama a los métodos "checkAnswer", "checkLives" y "setLayoutAtributes" del modelo, pasando como parámetro el entero correspondiente, asi como modificar la etiqueta del puntaje*/
    @IBAction func clickOption3(_ sender: UIButton) {
        modelRainbowNVL1.checkAnswer(answer: 2)
        lblScoreR1.text = "Puntaje: " + String(modelRainbowNVL1.score)
        checkLives()
        setLayoutAtributes()
    }
    
    /*El método "setLayoutAttributes" llama a "gameRound" del modelo para actualizar sus atributos y poder reflejarlos en el view*/
    func setLayoutAtributes() {
        modelRainbowNVL1.gameRound()
        lblColorR1.text = modelRainbowNVL1.colorText
        lblColorR1.textColor = modelRainbowNVL1.colorValue
        btnOption1R1.setImage(modelRainbowNVL1.imageView1, for: .normal)
        btnOption2R1.setImage(modelRainbowNVL1.imageView2, for: .normal)
        btnOption3R1.setImage(modelRainbowNVL1.imageView3, for: .normal)
    }

    //El método "checkLives" revisa el valor de las vidas en el modelo para hacer los cambios oportunos en las imagenes de vidas, asi como deshabilitas los botones al llegar a 0 y mandarlo a el View de gameOver y guardar su nuevo score si este fue mayor a su record personal
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
                newHigh = true
                ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: modelRainbowNVL1.score, game: 0)
            }
            performSegue(withIdentifier: "toGOR1", sender: nil)
        }
    }
    
    
    
}
