//
//  EditViewController.swift
//  realmLocal
//
//  Created by Luis on 12/17/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    public var contact: Contact!
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.text = contact.name
        txtYear.text = "\(contact.year)"
        txtPhone.text = contact.phone
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnEdit(_ sender: UIButton) {
        
        let id = contact.id
        let contacts = Contact()
        guard let name = txtName.text else { return }
        guard let year = txtYear.text else { return }
        guard let phone = txtPhone.text else { return }
        contacts.id = id
        contacts.name = name
        contacts.year = Int( year )!
        contacts.phone = phone
        
      
        try! realm.write {
            realm.add(contacts, update: true)
            self.navigationController?.popViewController(animated: true)
        }
       
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
