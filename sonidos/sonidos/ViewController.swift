//
//  ViewController.swift
//  sonidos
//
//  Created by admin on 01/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSong(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            image.image = UIImage(named: "perro")
            sounds( sound: "perro" )
        case 2:
            image.image = UIImage(named: "gato")
            sounds( sound: "gato" )
        case 3:
            image.image = UIImage(named: "elefante")
            sounds( sound: "elefante" )
        case 4:
            image.image = UIImage(named: "avion")
            sounds( sound: "avion" )
        case 5:
            image.image = UIImage(named: "carro")
            sounds( sound: "carro" )
        case 6:
            image.image = UIImage(named: "moto")
            sounds( sound: "moto" )
        case 7:
            image.image = UIImage(named: "tren")
            sounds( sound: "tren" )
        case 8:
            image.image = UIImage(named: "gallo")
            sounds( sound: "gallo" )
        case 9:
            image.image = UIImage(named: "pato")
            sounds( sound: "pato" )
        default:
            print("sin boton")
        }
    }
    
    private func sounds( sound:String ){
        do {
            let audioPath = Bundle.main.path(forResource: sound, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            player.play()
        } catch let error as NSError {
            print("hubo un error", error)
        }
    }


}

