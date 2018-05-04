//
//  EditController.swift
//  crudCoreData
//
//  Created by admin on 03/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import CoreData

class EditController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var active: UISwitch!
    
    var personEdit:Personas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = personEdit.nombre
        year.text = "\(personEdit.edad)"
        if personEdit.activo {
            active.isOn = true
        } else {
            active.isOn = false
        }
    }
    
    func conexion() -> NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }

    @IBAction func btnEdit(_ sender: UIButton) {
        
        let context = conexion()
        let yearPerson:Int16 = Int16(year.text!)!
        personEdit.setValue(name.text, forKey: "nombre")
        personEdit.setValue(yearPerson, forKey: "edad")
        personEdit.setValue(active.isOn, forKey: "activo")

        do {
            try context.save()
            print("se han editado los datos")
            navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("se produjo un error: \(error)")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  

}
