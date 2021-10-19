/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit

//Clase creada para desplegar opciones temprales en medio de los juegos por si el usuario quiere terminar la partida o regresar al juego
class PauseViewController: UIViewController {
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //funcion que regresa al usuario al juego
    @IBAction func backToGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //funcion que manda al usuario de regreso a la pantalla de Home
    @IBAction func exitGame(_ sender: Any) {
        performSegue(withIdentifier: "homeFromPause", sender: nil)
    }
    
}

