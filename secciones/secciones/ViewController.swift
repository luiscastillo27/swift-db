//
//  ViewController.swift
//  secciones
//
//  Created by admin on 10/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    let moviesAction = ["Avengers", "Iron Man", "Terminator", "Rambo"]
    let moviesHorror = ["Saw VI", "El conjuro", "El exor"]
    let moviesAnimation = ["ToyStory", "Coco", "Cars"]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return moviesAction.count
        } else if section == 1 {
            return moviesHorror.count
        } else {
            return moviesAnimation.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath )
        if indexPath.section == 0 {
            cell.textLabel?.text = moviesAction[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = moviesHorror[indexPath.row]
        } else {
            cell.textLabel?.text = moviesAnimation[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Accion"
        } else if section == 1 {
            return "Terror"
        } else {
            return "Animacion"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.blue
    }


}

