//
//  ViewProfile.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 31/08/21.
//

import UIKit

class ProfileViewController: UIViewController{
    var image = ""
    var mini = ""
    var screen = 0
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue:     UIStoryboardSegue, sender: Any?) {
        let destinationVC1 = segue.destination as? SignupViewController
        let destinationVC2 = segue.destination as? SettingsViewController
        destinationVC1?.image = image
        destinationVC1?.mini = mini
        destinationVC2?.image = image
        destinationVC2?.mini = mini
   }
  
   
    @IBAction func setPP1(_ sender: Any) {
        image = "PP (4).svg"
        mini = "PP46.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }
    }
    @IBAction func setPP2(_ sender: Any) {
        image = "PP (3).svg"
        mini = "PP36.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }    }
    @IBAction func setPP3(_ sender: Any) {
        image = "PP (5).svg"
        mini = "PP56.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }    }
    @IBAction func setPP4(_ sender: Any) {
        image = "PP (2).svg"
        mini = "PP26.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }    }
    @IBAction func setPP5(_ sender: Any) {
        image = "PP (6).svg"
        mini = "PP66.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }    }
    @IBAction func setPP6(_ sender: Any) {
        image = "PP (1).svg"
        mini = "PP16.svg"
        if screen == 0 {
            performSegue(withIdentifier: "returnPP", sender: nil)
        }
        else {
            performSegue(withIdentifier: "returnS", sender: nil)
        }    }
    
    
}
