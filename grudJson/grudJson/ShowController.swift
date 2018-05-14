//
//  ShowController.swift
//  grudJson
//
//  Created by admin on 13/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import Alamofire

class ShowController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        data()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contac = contacts[indexPath.row]
        cell.textLabel?.text = contac.nombre
        cell.detailTextLabel?.text = contac.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "edit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            if let id = table.indexPathForSelectedRow {
                let destino = segue.destination as! EditController
                let fila = contacts[id.row]
                destino.contact = fila
            }
        }
    }
    
    func data(){
        let url = URL(string: "http://127.0.0.1/~admin/api-swift/mostrar.php")
        Alamofire.request(url!).responseJSON { (response) in
            let result = response.data
            do{
                self.contacts = try JSONDecoder().decode([Contact].self, from: result!)
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }catch{
                print("Error hacer la peticion")
            }
        }
    }


}
