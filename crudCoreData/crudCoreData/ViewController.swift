//
//  ViewController.swift
//  crudCoreData
//
//  Created by admin on 02/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var active: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func conexion() ->NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        let context = conexion()
        let entityPersons = NSEntityDescription.entity( forEntityName: "Personas", in: context )
        let newPerson = NSManagedObject(entity: entityPersons!, insertInto: context )
        let yearPerson:Int16 = Int16(year.text!)!
        newPerson.setValue(name.text, forKey: "nombre")
        newPerson.setValue(yearPerson, forKey: "edad")
        newPerson.setValue(active.isOn, forKey: "activo")
        
        do {
            try context.save()
            print("se han guardado los datos")
            name.text = ""
            year.text = ""
            active.isOn = false
        } catch let error as NSError {
            print("se produjo un error: \(error)")
        }
        
    }
    
    
    @IBAction func btnDeleteAll(_ sender: UIButton) {
        let context = conexion()
        let resq = NSFetchRequest<NSFetchRequestResult>(entityName: "Personas")
        let delete = NSBatchDeleteRequest(fetchRequest: resq)
        do {
            try context.execute(delete)
            print("Se han eliminado correctamente")
        } catch let error as NSError {
            print("se produjo un error: \(error)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

