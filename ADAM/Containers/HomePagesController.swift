//
//  HomePages.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 05/10/21.
//

import UIKit

let sharedInstance = HomePagesController()

class HomePagesController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    class var instance: HomePagesController  {
        return sharedInstance;
    }

    var pages = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self

        let p1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "arcoirisId")
        let p2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "enFormitasId")
        let p3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "teCuentoId")


        pages.append(p1)
        pages.append(p2)
        pages.append(p3)


        setViewControllers([p1], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)-> UIViewController? {
       
        let cur = pages.firstIndex(of: viewController)!

        // if you prefer to NOT scroll circularly, simply add here:
        // if cur == 0 { return nil }

        var prev = (cur - 1) % pages.count
        if prev < 0 {
            prev = pages.count - 1
        }
        
        HomeViewController.instance.updateTextView(current: cur)
        return pages[prev]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
         
        let cur = pages.firstIndex(of: viewController)!

        // if you prefer to NOT scroll circularly, simply add here:
        // if cur == (pages.count - 1) { return nil }

        let nxt = abs((cur + 1) % pages.count)
        
        HomeViewController.instance.updateTextView(current: cur)
        return pages[nxt]
    }

    func presentationIndex(for pageViewController: UIPageViewController)-> Int {
        return pages.count
    }
    
}
