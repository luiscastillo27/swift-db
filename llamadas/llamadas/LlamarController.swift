//
//  LlamarController.swift
//  llamadas
//
//  Created by admin on 21/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit

class LlamarController: UIViewController {

    @IBOutlet weak var txtNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func callNumber(_ sender: UIButton) {
        let url = URL(string: "TELL://" + txtNumber.text!)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil )
    }
    

}
