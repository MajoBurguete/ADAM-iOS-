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
    
    
    @IBOutlet weak var btnEditL: UIButton!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var ivProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivProfilePic.image = UIImage(named: image)!
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen = 1
        let destinationVC = segue.destination as? ProfileViewController
        destinationVC?.screen = screen
     
   }
    
    @IBAction func btnEnter(_ sender: Any) {
        let userN = ModelManager.instance.countUsers() + 1
        let isInserted = ModelManager.instance.addUser(userNum: userN, username: tfUsername.text!, userImage: image, userMini: mini, scoreR: 0, scoreF: 0, scoreC: 0, current: 1)
        if isInserted {
        }
        else{
            tfUsername.text = "Error"

        }
    }
    
}
