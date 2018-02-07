//
//  ViewController.swift
//  firestore
//
//  Created by Luis on 06/02/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var tabla: UITableView!
    
    var ref:DocumentReference!
    var getRef:Firestore!
    var listaUsuarios = [Usuarios]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        getRef = Firestore.firestore()
        //mostrarUsuario()
        realTime()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaUsuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user: Usuarios
        user = listaUsuarios[indexPath.row]
        cell.textLabel?.text = user.nombre
        cell.detailTextLabel?.text = user.apellido
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let borrar = UITableViewRowAction(style: .destructive, title: "Eliminar") { ( accion, indexPath) in
            let user:Usuarios
            user = self.listaUsuarios[indexPath.row]
            let id = user.id
            self.getRef.collection("usuarios").document(id!).delete()
        }
        return [borrar]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            if let id = tabla.indexPathForSelectedRow {
                let fila = listaUsuarios[id.row]
                let destino = segue.destination as! EditViewController
                destino.editarUsuario = fila
            }
        }
    }
    
    func mostrarUsuario(){
        getRef.collection("usuarios").getDocuments { ( resp, error ) in
            if let error = error {
                print("hay un error en firebase", error)
            } else {
                for document in resp!.documents {
                    let id = document.documentID
                    let val = document.data()
                    let name = val["nombre"] as? String
                    let last = val["apellido"] as? String
                    let user = Usuarios(nombre: name, apellido: last, id: id)
                    self.listaUsuarios.append(user)
                    self.tabla.reloadData()
                }
            }
        }
    }
    
    func realTime(){
        getRef.collection("usuarios").addSnapshotListener { (resp , error) in
            if let error = error {
                print("hay un error en firebase", error)
            } else {
                self.listaUsuarios.removeAll()
                self.txtNombre!.text = ""
                self.txtApellido!.text = ""
                for document in resp!.documents {
                    let id = document.documentID
                    let val = document.data()
                    let name = val["nombre"] as? String
                    let last = val["apellido"] as? String
                    let user = Usuarios(nombre: name, apellido: last, id:id)
                    self.listaUsuarios.append(user)
                    self.tabla.reloadData()
                }
            }
        }
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

