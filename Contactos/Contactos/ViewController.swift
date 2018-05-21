//
//  ViewController.swift
//  Contactos
//
//  Created by admin on 20/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listContactos: [Contactos] = [Contactos]()
    var contacStore = CNContactStore()
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var editListener: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        contacStore.requestAccess(for: .contacts) { (acept, err) in
            if acept {
                print("acceso permitido")
                self.data()
            } else {
                print("acceso denegado")
            }
            if let error = err {
                print("se ha producido un error", error)
            }
        }
    }
    
    func data(){
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let req = CNContactFetchRequest(keysToFetch: key)
        req.sortOrder = CNContactSortOrder.givenName
        do {
            try contacStore.enumerateContacts(with: req, usingBlock: { (contacto, point) in
                let name = contacto.givenName
                let lastname = contacto.familyName
                let number = contacto.phoneNumbers.first?.value.stringValue
                let contactAdd = Contactos(nombre: name, apellido: lastname, numero: number!)
                self.listContactos.append(contactAdd)
            })
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        } catch let error as NSError {
            print("se ha producido un error!", error)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listContactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        let contact = listContactos[indexPath.row]
        cell.textLabel?.text = "\(contact.nombre) \(contact.apellido)"
        cell.detailTextLabel?.text = contact.numero
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = listContactos[sourceIndexPath.row]
        listContactos.remove(at: sourceIndexPath.row)
        listContactos.insert(item, at: sourceIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listContactos.remove(at: indexPath.row)
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    @IBAction func edit(_ sender: UIBarButtonItem) {
        table.isEditing = !table.isEditing
        if table.isEditing {
            editListener.title = "Ok"
        } else {
            editListener.title = "Editar"
        }
    }
    
}

