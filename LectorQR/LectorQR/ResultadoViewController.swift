//
//  ResultadoViewController.swift
//  LectorQR
//
//  Created by Jorge M. B. on 19/03/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    var resString : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        resultado.text = resString!
    }



}
