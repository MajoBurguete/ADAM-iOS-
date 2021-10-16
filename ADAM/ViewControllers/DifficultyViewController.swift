//
//  ViewDifficulty.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 05/10/21.
//

import UIKit

class DifficultyViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    @IBAction func backFromCuento(_ sender: Any) {
        performSegue(withIdentifier: "showHome", sender: nil)
    }
    
    @IBAction func backFromArcoiris(_ sender: Any) {
        performSegue(withIdentifier: "showHomeArc", sender: nil)
    }
    
    
    
    @IBAction func backFromFormitas(_ sender: Any) {
        performSegue(withIdentifier: "showHomeForm", sender: nil)
    }
    

}
