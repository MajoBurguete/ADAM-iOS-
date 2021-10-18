/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit



//Clase creada para registrar nuevos usuarios, dejandolos escoger un nombre y una imagen que los represente
class SignupViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    var image = ""
    var mini = ""
    @IBOutlet weak var lblValidate: UILabel!
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var btnEditL: UIButton!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var ivProfilePic: UIImageView!
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // se declara una variable para reconocer si se quiere bajar el teclado
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        //se inicia el boton deshabilitado para evitar que el usuario cree un percil sin nombre y se le da una imagen por defecto
        btnEnter.isEnabled = false
        ivProfilePic.image = UIImage(named: image)!
        tfUsername.addTarget(self, action: #selector(validateField(textfield:)), for: .editingChanged)
        
    }
    // funcion que verifica que el nombre que el usuario escribio este en el rango de 1 y 10 caracteres, deshabilitando el boton de continuacion y cambiando el color de algunos elementos para indicarle el error
    @objc func validateField(textfield: UITextField) {
        if textfield.text?.count == 0 {
            btnEnter.isEnabled = false
        } else if textfield.text?.count ?? 1 >= 10 {
            btnEnter.isEnabled = false
            lblValidate.textColor = UIColor(named: "rojo_r")
        } else {
            btnEnter.isEnabled = true
            lblValidate.textColor = UIColor(named: "verde")
        }
    }
    
    // funcion que se utiliza para mandar a la pantalla "profileViewController desde que pantalla viene para que sepa a cual regresar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen = 0
        let destinationVC = segue.destination as? ProfileViewController
        destinationVC?.screen = screen
   }
    
    //boton de registro y enntrada a la app que guarda los datos del usuario en la base de datos y lo declara como el usuario actual
    @IBAction func btnEnter(_ sender: Any) {
        let userN = ModelManager.instance.countUsers() + 1
        let isInserted = ModelManager.instance.addUser(userNum: userN, username: tfUsername.text!, userImage: image, userMini: mini, scoreR: 0, scoreF: 0, scoreC: 0, current: 0)
        ModelManager.instance.setCurrentUSer(userNum: userN)
        if isInserted {
        }
        else{
            tfUsername.text = "Error"
        }
    }
}
