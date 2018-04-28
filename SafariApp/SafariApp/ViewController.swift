//
//  ViewController.swift
//  SafariApp
//
//  Created by Jorge M. B. on 18/04/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func abrirEnSafari(_ sender: UIButton) {
        let url = URL(string: "https://iwebsapp.com")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    @IBAction func abrirEnApp(_ sender: UIButton) {
        let url = URL(string: "https://iwebsapp.com")
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let safari = SFSafariViewController(url: url!, configuration: config)
        present(safari, animated: true, completion: nil)
        safari.delegate = self
    }
    
}

