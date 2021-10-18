/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/

import UIKit

//Clase creada para desplegar los iconos a escoger para el usuario

class ProfileViewController: UIViewController{
    //Declaración de todas las variables necesarias para el funcionamiento del clase
    var image = ""
    var mini = ""
    var screen = 0
    let user = ModelManager.instance.findCurrentUSer()
    var achievement1 = false
    var achievement2 = false
    var achievement3 = false
    @IBOutlet weak var btnUnlock1: UIButton!
    @IBOutlet weak var btnUnlock2: UIButton!
    @IBOutlet weak var btnUnlock3: UIButton!
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        //condicionales que verifican si los desafios se han logrado, cambiando las imagenes de los iconos de manera acorde de bloqueados a desbloqueados
        if user.scoreC >= 2700 {
            achievement1 = true
            btnUnlock1.setBackgroundImage(UIImage(named: "PP (2).svg"), for: .normal)
        }
        if user.scoreR >= 10000 {
            achievement2 = true
            btnUnlock2.setBackgroundImage(UIImage(named: "PP (6).svg"), for: .normal)
        }
        if user.scoreR >= 2500 && user.scoreC >= 2500 && user.scoreF >= 2500 {
            achievement3 = true
            btnUnlock2.setBackgroundImage(UIImage(named: "PP (1).svg"), for: .normal)
        }
    }
    
    // funcion que se utiliza para mandar La imagen a desplegar en las pantallas de configuracion y registro para que el usuario observe antes de escoger.
    override func prepare(for segue:     UIStoryboardSegue, sender: Any?) {
        let destinationVC1 = segue.destination as? SignupViewController
        let destinationVC2 = segue.destination as? SettingsViewController
        destinationVC1?.image = image
        destinationVC1?.mini = mini
        destinationVC2?.image = image
        destinationVC2?.mini = mini
   }
  
   //funcion que manda el primer icono
    @IBAction func setPP1(_ sender: Any) {
        image = "PP (4).svg"
        mini = "PP46.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }
    }
    //funcion que manda el segundo icono
    @IBAction func setPP2(_ sender: Any) {
        image = "PP (3).svg"
        mini = "PP36.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }
    }
    //funcion que manda el tercer icono
    @IBAction func setPP3(_ sender: Any) {
        image = "PP (5).svg"
        mini = "PP56.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }
    }
    //funcion que manda el cuarto icono, dependiendo si se ha logrado el desafio, de lo contrario desplega una alerta informando como desbloquearlo
    @IBAction func setPP4(_ sender: Any) {
        if achievement1 {
            image = "PP (2).svg"
            mini = "PP26.svg"
            if screen == 0 {
                performSegue(withIdentifier: "returnPP", sender: nil)
            }
            else {
                performSegue(withIdentifier: "returnS", sender: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "¡Ícono bloqueado!", message: "¡Consigue 2,700 puntos en 'Te cuento un cuento' para obtener este ícono!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default) {
                action in print(action) }
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
        }
    }
    //funcion que manda el quinto icono, dependiendo si se ha logrado el desafio, de lo contrario desplega una alerta informando como desbloquearlo
    @IBAction func setPP5(_ sender: Any) {
        if achievement2 {
            image = "PP (6).svg"
            mini = "PP66.svg"
            if screen == 0 {
                performSegue(withIdentifier: "returnPP", sender: nil)
            }
            else {
                performSegue(withIdentifier: "returnS", sender: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "¡Ícono bloqueado!", message: "¡Consigue 10,000 puntos en 'Arcoiris' para obtener este ícono!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default) {
                action in print(action) }
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
        }
    }
    //funcion que manda el sexto icono, dependiendo si se ha logrado el desafio, de lo contrario desplega una alerta informando como desbloquearlo
    @IBAction func setPP6(_ sender: Any) {
        if achievement3 {
            image = "PP (1).svg"
            mini = "PP16.svg"
            if screen == 0 {
                performSegue(withIdentifier: "returnPP", sender: nil)
            }
            else {
                performSegue(withIdentifier: "returnS", sender: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "¡Ícono bloqueado!", message: "¡Consigue 2,500 puntos en todos los juegos para obtener este ícono!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default) {
                action in print(action) }
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
}
