//
//  ViewController.swift
//  TabSwipe
//
//  Created by Luis on 1/2/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit
import CarbonKit


class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let items = ["Features", "Products", "About"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    //
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let view1 = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let view2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let view3 = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        print( index )
        
        if index == 0 {
            return self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        } else if index == 1 {
            return self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        }
        return self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    }


}

