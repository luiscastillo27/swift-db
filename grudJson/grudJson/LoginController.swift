//
//  ViewController.swift
//  grudJson
//
//  Created by admin on 12/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var url:String = "http://127.0.0.1/~admin/api-swift/login.php"
    var respuesta = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        let parametros : Parameters = [
            "usuario": txtUser.text!,
            "password": txtPassword.text!,
        ]
        
        Alamofire.request(url, method: .post, parameters: parametros).responseJSON { (response) in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                self.respuesta = (jsonData.value(forKey: "mensaje") as! String?)!
                print(self.respuesta)
                if self.respuesta == "login completo"{
                    self.performSegue(withIdentifier: "login", sender: self)
                }else{
                    print("no funciono el login")
                }
                
                
            }
            
        }
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    

}

