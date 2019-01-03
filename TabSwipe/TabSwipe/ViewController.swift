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
        let items = ["Alta", "Media", "Baja"]
        
        let widthItems = self.view.frame.width / 5.3
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.setSelectedColor(UIColor.red)
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.red)
        carbonTabSwipeNavigation.setTabExtraWidth( widthItems )
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    //
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {        
        if index == 0 {
            return self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        } else if index == 1 {
            return self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        }
        return self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    }


}

