//
//  StoryViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet weak var tvStory: UITextView!
    
    
    @IBOutlet weak var ivLife1S: UIImageView!
    
    @IBOutlet weak var ivLife2S: UIImageView!
    
    @IBOutlet weak var ivLife3S: UIImageView!
    
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var tvQuestion: UITextView!
    
    @IBOutlet weak var tvScoreS: UILabel!
    
    @IBOutlet weak var tvResult: UILabel!
    
    @IBOutlet weak var btnFirstOption: UIButton!
    
    @IBOutlet weak var btnSecondOption: UIButton!
    
    
    @IBOutlet weak var btnThirdOption: UIButton!
    
    @IBOutlet weak var btnNextQ: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func pauseStoryS(_ sender: Any) {
        performSegue(withIdentifier: "pauseCuentoS", sender: nil)
    }
    
    
   
    @IBAction func pauseStoryQ(_ sender: Any) {
        performSegue(withIdentifier: "pauseCuentoQ", sender: nil)
    }
    
    
}
