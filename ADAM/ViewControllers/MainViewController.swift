/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/

import UIKit

//Clase inicial creada para desplegar los perfiles creados e iniciar sesion para entrar a la app
class MainViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    @IBOutlet weak var btnAddProfile: UILabel!
    @IBOutlet weak var btnProfile1: UIButton!
    @IBOutlet weak var btnProfile2: UIButton!
    @IBOutlet weak var btnProfile3: UIButton!
    @IBOutlet weak var lblProfile1: UILabel!
    @IBOutlet weak var lblProfile2: UILabel!
    @IBOutlet weak var lblProfile3: UILabel!
    @IBOutlet weak var lblAddProfile: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    // funcion que se utiliza para mandar La imagen a desplegar en la pantalla de registro para que el usuario observe antes de escoger.
    override func prepare(for segue:     UIStoryboardSegue, sender: Any?) {
        let image = "PP (4).svg"
        let mini = "PP46.svg"
        let destinationVC = segue.destination as? SignupViewController
        destinationVC?.image = image
        destinationVC?.mini = mini
      
    }
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        //se esconden todos los usuarios inicialmente
        btnAddProfile.isHidden = true
        lblAddProfile.isHidden = true
        btnProfile1.isHidden = true
        btnProfile2.isHidden = true
        btnProfile3.isHidden = true
        lblProfile1.isHidden = true
        lblProfile2.isHidden = true
        lblProfile3.isHidden = true
        
        //se consigue el numero de usuarios
        let userNum = ModelManager.instance.countUsers()
        //dependiendo de el numero de usuarios se despliegan los componentes en pantalla con los datos previamente guardados, habilitando o no la posibilidad de agregar nuevos perfiles
        if userNum == 0 {
            performSegue(withIdentifier: "toSignUp", sender: nil)
        }
       
        
        if userNum >= 1 {
            let user1 = ModelManager.instance.findUser(userNum: 1)
            btnProfile1.setBackgroundImage(UIImage(named: user1.userImage), for: .normal)
            print(user1.userImage)
            lblProfile1.text = user1.username
            btnProfile1.isHidden = false
            lblProfile1.isHidden = false
        }
        if userNum >= 2 {
            let user2 = ModelManager.instance.findUser(userNum: 2)
            btnProfile2.setBackgroundImage(UIImage(named: user2.userImage), for: .normal)
            lblProfile2.text = user2.username
            btnProfile2.isHidden = false
            lblProfile2.isHidden = false
        }
        if userNum == 3 {
            let user3 = ModelManager.instance.findUser(userNum: 3)
            btnProfile3.setBackgroundImage(UIImage(named: user3.userImage), for: .normal)
            lblProfile3.text = user3.username
            btnProfile3.isHidden = false
            lblProfile3.isHidden = false
        }
        else {
            btnAddProfile.isHidden = false
            lblAddProfile.isHidden = false
        }
    }
    //funcion que al presionar el boton lo manda con el usuario elegido, asignandolo como el usuario actual
    @IBAction func toHome1(_ sender: UIButton) {
        ModelManager.instance.setCurrentUSer(userNum: 1)
    }
    //funcion que al presionar el boton lo manda con el usuario elegido, asignandolo como el usuario actual
    @IBAction func toHome2(_ sender:
                           UIButton) {
        ModelManager.instance.setCurrentUSer(userNum: 2)
    }
    //funcion que al presionar el boton lo manda con el usuario elegido, asignandolo como el usuario actual
    @IBAction func toHome3(_ sender: UIButton) {
        ModelManager.instance.setCurrentUSer(userNum: 3)
    }
    //funcion que al presionar el boton lo manda a la pantalla de registro para crear un nuevo usuario
    @IBAction func toSignUp(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    

}

