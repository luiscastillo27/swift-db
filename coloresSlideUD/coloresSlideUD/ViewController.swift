//
//  ViewController.swift
//  coloresSlideUD
//
//  Created by Luis on 1/30/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rojo:Float = 0;
    var verde:Float = 0;
    var azul:Float = 0;
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valores();
    }
    
    @IBAction func slderRed(_ sender: UISlider) {
        rojo = sender.value;
        colores( rojo: CGFloat(rojo), verde: CGFloat(verde), azul: CGFloat(azul) );
        UserDefaults.standard.set(rojo, forKey: "rojo");
    }
    
    @IBAction func sliderGreen(_ sender: UISlider) {
        verde = sender.value;
        colores( rojo: CGFloat(rojo), verde: CGFloat(verde), azul: CGFloat(azul) );
        UserDefaults.standard.set(verde, forKey: "verde");
    }
    
    @IBAction func sliderBlue(_ sender: UISlider) {
        azul = sender.value;
        colores( rojo: CGFloat(rojo), verde: CGFloat(verde), azul: CGFloat(azul) );
        UserDefaults.standard.set(azul, forKey: "azul");
    }
    
    func colores( rojo:CGFloat, verde:CGFloat, azul:CGFloat ){
        view.backgroundColor = UIColor( red: rojo/255, green: verde/255, blue: azul/255, alpha: 1.0);
    }
    
    func valores(){
        if let r = UserDefaults.standard.object(forKey: "rojo") as? CGFloat,
           let g = UserDefaults.standard.object(forKey: "verde") as? CGFloat,
           let b = UserDefaults.standard.object(forKey: "azul") as? CGFloat {
        
            colores(rojo: r, verde: g, azul: b);
            redSlider.value = Float(r);
            greenSlider.value = Float(g);
            blueeSlider.value = Float(b);
            
            
        }
    }
    

}

