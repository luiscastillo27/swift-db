//
//  ViewController.swift
//  firestore
//
//  Created by Luis on 06/02/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    
    var ref:DocumentReference!
    var getRef:Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
    }
    
    @IBAction func btnGuardar(_ sender: UIButton) {
        let campos: [String:Any] = [ "nombre": txtNombre.text!, "apellido": txtApellido.text! ]
        ref = getRef.collection("usuarios").addDocument(data: campos, completion: { ( error ) in
            if let error = error?.localizedDescription {
                print("error al guardar", error)
            } else {
                print("se guardo correctamente")
            }
        })
    }
    


}

