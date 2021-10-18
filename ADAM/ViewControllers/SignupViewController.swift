//
//  ViewSignupController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit


class SignupViewController: UIViewController {
    
    var image = ""
    var mini = ""
    
    
    @IBOutlet weak var lblValidate: UILabel!
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var btnEditL: UIButton!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var ivProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        btnEnter.isEnabled = false
        ivProfilePic.image = UIImage(named: image)!
        
        tfUsername.addTarget(self, action: #selector(validateField(textfield:)), for: .editingChanged)
        
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen = 0
        let destinationVC = segue.destination as? ProfileViewController
        destinationVC?.screen = screen
     
   }
    
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
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
