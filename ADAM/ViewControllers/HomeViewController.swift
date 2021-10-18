//
//  ViewHome.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 06/10/21.
//

import UIKit

let sharedInstanceH = HomeViewController()

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var btnUserImage: UIButton!
    
    let viewController = HomePagesController.instance
    var currentPage: Int!
    
    class var instance: HomeViewController  {
        return sharedInstanceH;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sharedInstanceH.currentPage = 0
        let user = ModelManager.instance.findCurrentUSer()
        print("user number test")
        print(user.userNum)
        print(user.username)
        lblUser.text = user.username
        btnUserImage.setBackgroundImage(UIImage(named: user.userMini), for: .normal)
        
    }
    
    func updateTextView(current: Int){
        currentPage = current
        
    }

    @IBAction func nextPage(_ sender: Any) {
        /*let cont = viewController.pageViewController(viewController, viewControllerAfter: viewController.pages[currentPage])! as UIViewController
        viewController.setViewControllers([cont], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)*/
    }
    
    @IBAction func previousPage(_ sender: Any) {
        
    }
    
    
    @IBAction func enterGame(_ sender: Any) {
        if sharedInstanceH.currentPage == 0 {
            performSegue(withIdentifier: "showArcoiris", sender: nil)
        }
        else if sharedInstanceH.currentPage == 1 {
            performSegue(withIdentifier: "showFormitas", sender: nil)
        }
        else if sharedInstanceH.currentPage == 2 {
            performSegue(withIdentifier: "showCuento", sender: nil)
        }
    }
    
}

