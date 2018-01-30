//
//  ViewController.swift
//  UserDefault
//
//  Created by Luis on 1/29/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtResult: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnGuardar(_ sender: UIButton) {
        if( txtResult.text == ""){
            let alerta = UIAlertController(title: "Alerta", message: "Escribe algo", preferredStyle: .alert);
            let aceptar = UIAlertAction(title: "Jim Fea", style: .default, handler: nil);
            alerta.addAction(aceptar);
            present(alerta, animated: true, completion: nil);
        } else {
            UserDefaults.standard.set(txtResult.text, forKey: "Jim");
            txtResult.text = "";
            txtResult.resignFirstResponder();
        }
    }
    
    @IBAction func btnMostrar(_ sender: UIButton) {
        let result = UserDefaults.standard.object(forKey: "Jim");
        txtResult.text = result as? String;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    
}

