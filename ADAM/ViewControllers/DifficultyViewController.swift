/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/

import UIKit

//Clase creada para desplegar el las opciones de dificultad de todos los juegos, mandandolos al viewcontroller correspondiente, asi como la view de pausa para regreaar a esta pantalla de ser necesario

class DifficultyViewController: UIViewController {
    
    var difficultyStory = 1
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    //boton de pausa que regresa a instrucciones del juego "Te Cuento Un Cuento"
    @IBAction func backFromCuento(_ sender: Any) {
        performSegue(withIdentifier: "showHome", sender: nil)
    }
    
    //boton de pausa que regresa a instrucciones del juego "Arcoiris"
    @IBAction func backFromArcoiris(_ sender: Any) {
        performSegue(withIdentifier: "showHomeArc", sender: nil)
    }
    
    //boton de pausa que regresa a instrucciones del juego "En Formitas"
    @IBAction func backFromFormitas(_ sender: Any) {
        performSegue(withIdentifier: "showHomeForm", sender: nil)
    }
    
    // funcion que se utiliza para mandar la dificultad del juego a la View de "Te Cuento un Cuento"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StoryViewController {
            let vc = segue.destination as? StoryViewController
            vc?.difficulty = difficultyStory
        }
    }
    
    
    //se declara la dificultad facil para "Te Cuento un Cuento"
    @IBAction func easyLevelStory(_ sender: Any) {
        difficultyStory = 1
        performSegue(withIdentifier: "startStoryGame", sender: nil)
    }
    
    //se declara la dificultad intermedia para "Te Cuento un Cuento"
    @IBAction func mediumLevelStory(_ sender: Any) {
        difficultyStory = 2
        performSegue(withIdentifier: "startStoryGame", sender: nil)
    }
    
    
    //se declara la dificultad dificil para "Te Cuento un Cuento"
@IBAction func hardLevelStory(_ sender: Any) {
        difficultyStory = 3
        performSegue(withIdentifier: "startStoryGame", sender: nil)
    }
    

}
