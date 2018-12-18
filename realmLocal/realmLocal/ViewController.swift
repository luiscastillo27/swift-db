//
//  ViewController.swift
//  realmLocal
//
//  Created by Luis on 12/17/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    private let realm = try! Realm()
    private var listContacts: Results<Contact>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listContacts = realm.objects(Contact.self)
        table.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = listContacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goEdit", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goEdit" {
            if let id = self.table.indexPathForSelectedRow {
                let fila = self.listContacts[id.row]
                let destino = segue.destination as! EditViewController
                destino.contact = fila
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let contacts = self.listContacts[indexPath.row]
        try! self.realm.write {
            self.realm.delete(contacts)
            self.table.reloadData()
        }
    }

    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Contactos", message: "Guarda un contacto", preferredStyle: .alert )
        alert.addTextField { (name) in
            name.placeholder = "Nombre completo"
        }
        alert.addTextField { (year) in
            year.placeholder = "Edad"
        }
        alert.addTextField { (phone) in
            phone.placeholder = "Telefono celular"
        }
        let save = UIAlertAction(title: "Guardar", style: .default, handler: { (action) in
           
            guard let name = alert.textFields?[0].text else { return }
            guard let year = Int( (alert.textFields?[1].text)! ) else { return }
            guard let phone = alert.textFields?[2].text else { return }
            
            let contact = Contact()
            contact.id = UUID().uuidString
            contact.name = name
            contact.phone = phone
            contact.year = year
            
            try! self.realm.write {
                self.realm.add(contact)
                self.table.reloadData()
                print("se ha guardado")
            }
            
        })
        let cancel = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil )
        alert.addAction(save)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil )
    }
    
    
    @IBAction func btnDeleteAll(_ sender: UIBarButtonItem) {
        try! realm.write {
            self.realm.deleteAll()
            self.table.reloadData()
        }
    }
    
}

