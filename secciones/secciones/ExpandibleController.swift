//
//  ExpandibleController.swift
//  secciones
//
//  Created by admin on 10/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit

struct Peliculas {
    var abrir = Bool()
    var genero: String
    var pelicula = [String]()
}

class ExpandibleController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    var list = [Peliculas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        list = [
                    Peliculas(abrir: false, genero: "Accion", pelicula: ["Avengers", "Iron Man", "Terminator", "Rambo"]),
                    Peliculas(abrir: false, genero: "Terror", pelicula: ["Saw VI", "El conjuro", "El exor"]),
                    Peliculas(abrir: false, genero: "Animacion", pelicula: ["ToyStory", "Coco", "Cars"])
               ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if list[section].abrir == true {
            return list[section].pelicula.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
            cell.textLabel?.text = list[indexPath.section].genero
            cell.backgroundColor = UIColor.blue
            cell.textLabel?.textColor = UIColor.white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
            cell.textLabel?.text = list[indexPath.section].pelicula[indexPath.row - 1]
            cell.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.black
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if list[indexPath.section].abrir == true {
                list[indexPath.section].abrir = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            } else {
                list[indexPath.section].abrir = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            }
        }
        
    }
    
    

}
