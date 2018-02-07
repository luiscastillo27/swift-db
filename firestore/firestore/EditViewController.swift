//
//  EditViewController.swift
//  firestore
//
//  Created by Luis on 06/02/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import Firebase

class EditViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    var editarUsuario:Usuarios!
    var ref: DocumentReference!
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNombre.text = editarUsuario.nombre
        txtApellido.text = editarUsuario.apellido
        id = editarUsuario.id!
        ref = Firestore.firestore().collection("usuarios").document(id)
    }
    
    @IBAction func btnCancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnGuardar(_ sender: UIButton) {
        let campos: [String:Any] = [ "nombre": txtNombre.text!, "apellido": txtApellido.text! ]
        ref.setData( campos ) { (error) in
            if let error = error?.localizedDescription {
                print("Ocurrio un error: ", error)
            } else {
                print("Actualizo correctamente")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    

}
