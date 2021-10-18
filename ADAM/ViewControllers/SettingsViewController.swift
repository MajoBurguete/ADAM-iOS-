//
//  SettingsViewController.swift
//  ADAM
//
//  Created by Marco Flamenco on 17/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var ivProfilePicS: UIImageView!
    @IBOutlet weak var tfUsernameS: UITextField!
    let user = ModelManager.instance.findCurrentUSer()
    var image = ""
    var mini = ""

    @IBOutlet weak var lblValidation: UILabel!
    @IBOutlet weak var btnSaveS: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        tfUsernameS.text = user.username
        if image == "" {
            ivProfilePicS.image = UIImage(named: user.userImage)
        } else {
            ivProfilePicS.image = UIImage(named: image)
        }
        
        tfUsernameS.addTarget(self, action: #selector(validateField(textfield:)), for: .editingChanged)
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen = 1
        let destinationVC = segue.destination as? ProfileViewController
        destinationVC?.screen = screen
     
   }
    
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
    @IBAction func btnDeleteUSer(_ sender: Any) {
        ModelManager.instance.deleteUser(userNum: user.userNum)
    }
}

