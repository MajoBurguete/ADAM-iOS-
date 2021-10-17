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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfUsernameS.text = user.username
        if image == "" {
            ivProfilePicS.image = UIImage(named: user.userImage)
        }
        else {
            ivProfilePicS.image = UIImage(named: image)

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen = 1
        let destinationVC = segue.destination as? ProfileViewController
        destinationVC?.screen = screen
     
   }
    
    @IBAction func btnSaveS(_ sender: Any) {
        let changedUser = ModelManager.instance.modifyUser(userNum: user.userNum, username: tfUsernameS.text!, userImage: image, userMini: mini)
        if !changedUser {
            tfUsernameS.text = "Error"
        }
        performSegue(withIdentifier: "toHomeFromS", sender: nil)
        
    }
    @IBAction func btnDeleteUSer(_ sender: Any) {
        ModelManager.instance.deleteUser(userNum: user.userNum)
    }
}

