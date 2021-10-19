/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit

//Clase creada para Mostrar al usuario sus puntajes mas altos en cada juego, asi como su nombre y su imagen 
class UserProfileViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    @IBOutlet weak var lblUserP: UILabel!
    @IBOutlet weak var ivProfilePic: UIImageView!
    @IBOutlet weak var lblScoreR: UILabel!
    @IBOutlet weak var lblScoreF: UILabel!
    @IBOutlet weak var lblScoreC: UILabel!
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        //se crea un objeto con los atributos del usuario actual y se modifican los componentes visuales correspondientes
        let user = ModelManager.instance.findCurrentUSer()
        lblUserP.text = user.username
        ivProfilePic.image = UIImage(named: user.userMini)
        lblScoreR.text = String(user.scoreR)
        lblScoreF.text = String(user.scoreF)
        lblScoreC.text = String(user.scoreC)

    }
    
}
