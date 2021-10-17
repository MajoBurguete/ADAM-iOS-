//
//  UserProfileViewController.swift
//  ADAM
//
//  Created by Marco Flamenco on 17/10/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    @IBOutlet weak var lblUserP: UILabel!
    @IBOutlet weak var ivProfilePic: UIImageView!
    @IBOutlet weak var lblScoreR: UILabel!
    
    @IBOutlet weak var lblScoreF: UILabel!
    @IBOutlet weak var lblScoreC: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = ModelManager.instance.findCurrentUSer()
        lblUserP.text = user.username
        ivProfilePic.image = UIImage(named: user.userMini)
        lblScoreR.text = String(user.scoreR)
        lblScoreF.text = String(user.scoreF)
        lblScoreC.text = String(user.scoreC)

    }
    
}
