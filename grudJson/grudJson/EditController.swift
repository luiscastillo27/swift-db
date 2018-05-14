//
//  EditController.swift
//  grudJson
//
//  Created by admin on 13/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import Alamofire

class EditController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var contact: Contact!
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUser.text = contact.nombre
        txtName.text = contact.nombre
        txtEmail.text = contact.email
    }



}
