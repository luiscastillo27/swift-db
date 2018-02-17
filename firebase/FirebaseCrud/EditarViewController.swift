//
//  EditarViewController.swift
//  FirebaseCrud
//
//  Created by Jorge Maldonado Borbón on 06/10/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
class EditarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var genero: UITextField!
    var ref: DatabaseReference!
    var editarJuegos: Juegos!
    var plataforma : String!
    var id = ""
    var portada = ""
    var imagen = UIImage()
    var idFirebase = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        nombre.text = editarJuegos.nombre
        genero.text = editarJuegos.genero
        id = editarJuegos.id!
        portada = editarJuegos.imagen!
        idFirebase = (Auth.auth().currentUser?.uid)!
    }

    @IBAction func editar(_ sender: UIButton) {
        
        let storage = Storage.storage().reference()
        let nombreImagen = UUID()
        let directorio = storage.child("imagenes/\(nombreImagen)")
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        directorio.putData(UIImagePNGRepresentation(imagen)!, metadata: metaData) { (data, error) in
            if error == nil {
                print("cargo la imagen")
                let borrarImagen = Storage.storage().reference(forURL: self.portada)
                borrarImagen.delete(completion: nil)
                
                let campos = ["nombre": self.nombre.text!,
                              "genero": self.genero.text!,
                              "id": self.id,
                              "portada": String(describing: directorio)]
                self.ref.child(self.idFirebase).child(self.plataforma).child(self.id).setValue(campos)
                self.dismiss(animated: true, completion: nil)
                
            }else{
                if let error = error?.localizedDescription {
                    print("error al subir imagen en firebase", error)
                }else{
                    print("error en el codigo")
                }
            }
        }
        
        
        
        
        
    }
    
   
    @IBAction func camara(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cancelar(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagenTomada = info[UIImagePickerControllerEditedImage] as? UIImage
        imagen = imagenTomada!
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
