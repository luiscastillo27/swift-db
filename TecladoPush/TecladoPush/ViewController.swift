//
//  ViewController.swift
//  TecladoPush
//
//  Created by Jorge M. B. on 16/07/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var texto1: UITextField!
    @IBOutlet weak var texto2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        texto1.delegate = self
        texto2.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        texto2.addTarget(self, action: #selector(cambioTeclado), for: UIControlEvents.touchDown)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func boton(_ sender: Any) {
        texto2.resignFirstResponder()
    }
    
    @objc func teclado(notificacion: Notification){
        
        guard let tecladoUp = (notificacion.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notificacion.name == Notification.Name.UIKeyboardWillShow {
            self.view.frame.origin.y = -tecladoUp.height
        }else{
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        print("ejecutar accion")
        return true
    }
    
    @objc func cambioTeclado(){
        print("cambio")
        texto2.keyboardType = .numberPad
    }
    
}

