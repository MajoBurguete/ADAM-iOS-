//
//  ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 28/08/21.
//

import UIKit

class MainViewController: UIViewController {
    

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
    
    override func prepare(for segue:     UIStoryboardSegue, sender: Any?) {
        let image = "PP (4).svg"
        let mini = "PP46.svg"
        let destinationVC = segue.destination as? SignupViewController
        destinationVC?.image = image
        destinationVC?.mini = mini
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAddProfile.isHidden = true
        lblAddProfile.isHidden = true
        btnProfile1.isHidden = true
        btnProfile2.isHidden = true
        btnProfile3.isHidden = true
        lblProfile1.isHidden = true
        lblProfile2.isHidden = true
        lblProfile3.isHidden = true
        
        let userNum = ModelManager.instance.countUsers()
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
    @IBAction func toHome1(_ sender: UIButton) {
        ModelManager.instance.setCurrentUSer(userNum: 1)
    }
    @IBAction func toHome2(_ sender:
                           UIButton) {
        ModelManager.instance.setCurrentUSer(userNum: 2)
    }
    @IBAction func toHome3(_ sender: UIButton) {
        ModelManager.instance.setCurrentUSer(userNum: 3)
    }
    @IBAction func toSignUp(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    

}

