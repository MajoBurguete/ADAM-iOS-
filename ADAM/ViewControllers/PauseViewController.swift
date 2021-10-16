//
//  ViewPauseController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class PauseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    @IBAction func backToGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func exitGame(_ sender: Any) {
        performSegue(withIdentifier: "homeFromPause", sender: nil)
    }
    
}

