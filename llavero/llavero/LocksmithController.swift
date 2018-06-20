//
//  LocksmithController.swift
//  llavero
//
//  Created by Luis Castillo on 6/20/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import Locksmith

class LocksmithController: UIViewController {

    @IBOutlet weak var txtValue: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSave(_ sender: UIButton) {
        do {
            try Locksmith.saveData(data: ["myKey27": txtValue.text!, "myKey15": "Que onda"], forUserAccount: "jimcastillo")
            print("Se ha guardado correctamente")
        } catch let error as NSError {
            print("No se ha guardado: \(error)")
        }
    }
    
    @IBAction func btnShow(_ sender: UIButton) {
        let show = Locksmith.loadDataForUserAccount(userAccount: "jimcastillo")
        print("mis llaves son:", show?["myKey27"] ?? "Nada que mostrar")
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        do {
            try Locksmith.updateData(data: ["myKey27": txtValue.text!], forUserAccount: "jimcastillo")
            print("Se actualizo correctamente")
        } catch let error as NSError {
            print("Se ha producido un error: \(error)")
        }
    }
    
    
    @IBAction func btnDelete(_ sender: UIButton) {
        do {
            try Locksmith.deleteDataForUserAccount(userAccount: "jimcastillo")
            print("se ha eliminado correctamente")
        } catch let error as NSError {
            print("se ha producido un error: \(error)")
        }
    }
    
    
}
