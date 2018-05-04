//
//  GenerarViewController.swift
//  LectorQR
//
//  Created by Jorge M. B. on 19/03/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit

class GenerarViewController: UIViewController {

    @IBOutlet weak var opcionCodigo: UISegmentedControl!
    
    @IBOutlet weak var texto: UITextField!
    
    @IBOutlet weak var imagenCodigo: UIImageView!
    
    var filtro : CIFilter!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func generar(_ sender: UIButton) {
        if let datos = texto.text {
            let datosTexto = datos.data(using: .ascii, allowLossyConversion: false)
            if opcionCodigo.selectedSegmentIndex == 0 {
                filtro = CIFilter(name: "CICode128BarcodeGenerator")
            }else{
                filtro = CIFilter(name: "CIQRCodeGenerator")
            }
            
            filtro.setValue(datosTexto, forKey: "inputMessage")
            let transformar = CGAffineTransform(scaleX: 10, y: 10)
            let imagen = UIImage(ciImage: filtro.outputImage!.transformed(by: transformar))
            imagenCodigo.image = imagen
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}











