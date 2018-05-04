//
//  ShowDataController.swift
//  crudCoreData
//
//  Created by admin on 03/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import CoreData

class ShowDataController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var table: UITableView!
    var persons:[Personas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        showData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    func conexion() -> NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func showData(){
        let conect = conexion()
        let resq: NSFetchRequest<Personas> = Personas.fetchRequest()
        do {
            persons = try conect.fetch(resq)
        } catch let error as NSError {
            print("se ha producido un erro: \(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editar", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editar"{
            if let id = table.indexPathForSelectedRow {
                let fila = persons[id.row]
                let destino = segue.destination as! EditController
                destino.personEdit = fila
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        let person = persons[indexPath.row]
        
        if person.activo {
            cell.textLabel?.text = "💚 \(person.nombre!)"
            cell.detailTextLabel?.text = "\(person.edad)"
        } else {
            cell.textLabel?.text = "❤️ \(person.nombre!)"
            cell.detailTextLabel?.text = "\(person.edad)"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let conect = conexion()
        let person = persons[indexPath.row]
        if editingStyle == .delete {
            conect.delete(person)
            do {
                try conect.save()
            } catch let error as NSError {
                print("se ha producido un erro: \(error)")
            }
        }
        showData()
        table.reloadData()
        
    }
    

}
