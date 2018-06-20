//
//  KeychainItemWrapperController.swift
//  llavero
//
//  Created by Luis Castillo on 6/20/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class KeychainItemWrapperController: UIViewController {

    @IBOutlet weak var txtValue: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSave(_ sender: UIButton) {
        let save: Bool = KeychainWrapper.standard.set(txtValue.text!, forKey: "miLlavero")
        print("Llavero guardado: \(save)")
    }
    
    @IBAction func btnShow(_ sender: UIButton) {
        let show: String? = KeychainWrapper.standard.string(forKey: "miLlavero")
        print("Mi llavero es:", show ?? "Nada que mostar")
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        let delete: Bool = KeychainWrapper.standard.removeObject(forKey: "miLlavero")
        print("Llavero eliminado: \(delete)")
    }
    
    
}
