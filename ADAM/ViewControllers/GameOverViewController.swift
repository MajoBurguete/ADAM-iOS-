/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit

//Clase creada Desplegar al final de cada juego el puntaje obtenido por el usuario asi com las opciones de jugar de nuevo o regresar a la pantalla de home
class GameOverViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    var score = 0
    var game = ""
    var newHigh = false
    @IBOutlet weak var lblNewHighCuento: UILabel!
    @IBOutlet weak var tvScoreCuento: UILabel!
    @IBOutlet weak var lblNewHighArcoiris: UILabel!
    @IBOutlet weak var tvScoreArcoiris: UILabel!
    @IBOutlet weak var lblNewHighFormitas: UILabel!
    @IBOutlet weak var tvScoreFormitas: UILabel!
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        print(score)
        //condicionales que checan de que juego proviene el usuario, desplegando el score obtenido y si este es su nuevo record personal
        if game == "cuento" {
            tvScoreCuento.text = String(score)
            if newHigh == true {
                lblNewHighCuento.isHidden = false
            }
        }
        if game == "arcoiris" {
            tvScoreArcoiris.text = String(score)
            if newHigh == true {
                lblNewHighArcoiris.isHidden = false
            }
        }
        if game == "formitas" {
            tvScoreFormitas.text = String(score)
            if newHigh == true {
                lblNewHighFormitas.isHidden = false
            }
        }     
    }
        
    //funciones que mandan al usuario a jugar de nuevo o salir dependiendo del juego del que provienen y su eleccion
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
