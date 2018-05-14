//
//  AddController.swift
//  grudJson
//
//  Created by admin on 12/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import Alamofire

class AddController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var url:String = "http://127.0.0.1/~admin/api-swift/registro.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func create(_ sender: UIButton) {
        let params: Parameters = [
            "usuario": txtUser.text!,
            "password": txtPassword.text!,
            "nombre": txtName.text!,
            "email": txtEmail.text!
        ]
        Alamofire.request(url, method: .post, parameters: params ).responseJSON { (data) in
            if let result = data.result.value {
                let json = result as! NSDictionary
                let resp = json["mensaje"] as! String
                if resp == "Se ha registrado con exito"{
                    self.txtUser.text = ""
                    self.txtPassword.text = ""
                    self.txtName.text = ""
                    self.txtEmail.text = ""
                    self.dismiss( animated: true, completion: nil )
                } else {
                    print("error")
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
}
