//
//  ViewController.swift
//  Filtros
//
//  Created by Luis on 07/02/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

struct Personas {
    let nombre: String?
    let genero: String?
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var search: UISearchBar!
    var listaPersonas = [Personas]()
    var personasCeldasFiltro = [Personas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let val1 = Personas(nombre: "Luis", genero: "Masculino")
        listaPersonas.append(val1)
        let val2 = Personas(nombre: "Ana", genero: "Femenino")
        listaPersonas.append(val2)
        let val3 = Personas(nombre: "Mireya", genero: "Femenino")
        listaPersonas.append(val3)
        let val4 = Personas(nombre: "Kevin", genero: "Masculino")
        listaPersonas.append(val4)
        let val5 = Personas(nombre: "Pedro", genero: "Masculino")
        listaPersonas.append(val5)
        let val6 = Personas(nombre: "Alexis", genero: "Masculino")
        listaPersonas.append(val6)
        let val7 = Personas(nombre: "Yesenia", genero: "Femenino")
        listaPersonas.append(val7)
        let val8 = Personas(nombre: "Abi", genero: "Femenino")
        listaPersonas.append(val8)
        let val9 = Personas(nombre: "Carlos", genero: "Masculino")
        listaPersonas.append(val9)
        let val10 = Personas(nombre: "Laura", genero: "Femenino")
        listaPersonas.append(val10)
        personasCeldasFiltro = listaPersonas
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personasCeldasFiltro.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let persona:Personas
        persona = personasCeldasFiltro[indexPath.row]
        cell.textLabel?.text = persona.nombre
        cell.detailTextLabel?.text = persona.genero
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //BUSAR Y FILTRAR
        personasCeldasFiltro = listaPersonas.filter({ ( persona ) -> Bool in
            switch search.selectedScopeButtonIndex {
                case 0:
                    if searchText.isEmpty { return true }
                    return persona.nombre!.lowercased().contains(searchText.lowercased())
                case 1:
                    if searchText.isEmpty { return persona.genero == "Masculino" }
                    return persona.nombre!.lowercased().contains(searchText.lowercased()) && persona.genero == "Masculino"
                case 2:
                    if searchText.isEmpty { return persona.genero == "Femenino" }
                    return persona.nombre!.lowercased().contains(searchText.lowercased()) && persona.genero == "Femenino"
                default:
                    return false
            }
        })
        
        DispatchQueue.main.async {
            self.tabla.reloadData()
        }
        
        
        
        /*
        //SOLO BUSCAR
        guard !searchText.isEmpty else {
            personasCeldasFiltro = listaPersonas
            DispatchQueue.main.async {
                self.tabla.reloadData()
            }
            return
        }
        personasCeldasFiltro = listaPersonas.filter({ ( persona ) -> Bool in
            persona.nombre!.lowercased().contains(searchText.lowercased())
        })
        DispatchQueue.main.async {
            self.tabla.reloadData()
        }
        */
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
            case 0:
                personasCeldasFiltro = listaPersonas
            case 1:
                personasCeldasFiltro = listaPersonas.filter({ (persona) -> Bool in
                    persona.genero == "Masculino"
                })
            case 2:
                personasCeldasFiltro = listaPersonas.filter({ (persona) -> Bool in
                    persona.genero == "Femenino"
                })
            default:
                print("nada")
        }
        DispatchQueue.main.async {
            self.tabla.reloadData()
        }
    }


}

