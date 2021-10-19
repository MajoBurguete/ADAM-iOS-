//
//  SettingsViewController.swift
//  ADAM
//
//  Created by Marco Flamenco on 17/10/21.
//

import UIKit

//Clase creada para la modificacion de los datos del usuario
class SettingsViewController: UIViewController {
    
    let modelManagerS = ModelManager()
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    var image = ""
    var mini = ""
    @IBOutlet weak var ivProfilePicS: UIImageView!
    @IBOutlet weak var tfUsernameS: UITextField!
    @IBOutlet weak var lblValidation: UILabel!
    @IBOutlet weak var btnSaveS: UIButton!
    //se crea un objeto con los atributos del usuario actual
    let user = ModelManager.instance.findCurrentUSer()
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // se declara una variable para reconocer si se quiere bajar el teclado
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        //se desplega el nombre del usuario en el textField
        tfUsernameS.text = user.username
        //dependiendo de si eligio una imagen o no en ProfilePicture, se establece la imagen anterior o la nueva seleccionada
        if image == "" {
            ivProfilePicS.image = UIImage(named: user.userImage)
        } else {
            ivProfilePicS.image = UIImage(named: image)
        }
        tfUsernameS.addTarget(self, action: #selector(validateField(textfield:)), for: .editingChanged)
    }
    
    // funcion que verifica que el nombre que el usuario escribio este en el rango de 1 y 10 caracteres, deshabilitando el boton de continuacion y cambiando el color de algunos elementos para indicarle el error
    @objc func validateField(textfield: UITextField) {
        if textfield.text?.count == 0 {
            btnSaveS.isEnabled = false
        } else if textfield.text?.count ?? 1 >= 10 {
            btnSaveS.isEnabled = false
            lblValidation.textColor = UIColor(named: "rojo_r")
        } else {
            btnSaveS.isEnabled = true
            lblValidation.textColor = UIColor(named: "verde")
        }
    }
    
    // funcion que se utiliza para mandar a la pantalla "profileViewController desde que pantalla viene para que sepa a cual regresar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen = 1
        let destinationVC1 = segue.destination as? ProfileViewController
        destinationVC1?.screen = screen
        let destinationVC2 = segue.destination as? SignupViewController
        destinationVC2?.screen = screen
     
   }
    
    //boton de registro que guarda los cambios en la base de datos y los establece en el usuario actual y manda al usuario a Home
    @IBAction func btnSaveS(_ sender: Any) {
        if image != "" {
            let changedUser = ModelManager.instance.modifyUser(userNum: user.userNum, username: tfUsernameS.text!, userImage: image, userMini: mini)
            if !changedUser {
                tfUsernameS.text = "Error"
            }
        }
        else{
            let changedUser = ModelManager.instance.modifyUser(userNum: user.userNum, username: tfUsernameS.text!, userImage: user.userImage, userMini: user.userMini)
            if !changedUser {
                tfUsernameS.text = "Error"
            }
        }
        performSegue(withIdentifier: "toHomeFromS", sender: nil)
        
    }
    //boton para borrar tu usuario, mandando al usuario de regreso a la pantalla Main para que escoga o cree otro usuario
    @IBAction func btnDeleteUSer(_ sender: Any) {
        let alert = UIAlertController(title: "¡Cuidado!", message: "¿Seguro que quieres borrar tu perfil?", preferredStyle: .alert)
        let eraseAction = UIAlertAction(title: "Si", style: .destructive) { [self]
            action in
            modelManagerS.deleteUser(userNum: user.userNum)
            if modelManagerS.countUsers() > 0 {
                performSegue(withIdentifier: "toHomeFromS", sender: nil)
            }
            else {
                performSegue(withIdentifier: "toSignUpFromS", sender: nil)
            }
        }
        let returnAction = UIAlertAction(title: "No", style: .default) {
            action in print(action) }
        alert.addAction(eraseAction)
        alert.addAction(returnAction)
        present(alert, animated: true, completion: nil)
    }
}

