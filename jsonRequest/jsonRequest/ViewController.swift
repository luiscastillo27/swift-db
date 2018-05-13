//
//  ViewController.swift
//  jsonRequest
//
//  Created by admin on 12/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    var user = [User]()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        data()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        let usr = user[indexPath.row]
        cell.textLabel?.text = usr.name
        cell.detailTextLabel?.text = usr.address.city
        return cell
    }
    
    func data(){
        let data: String = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: data)
        URLSession.shared.dataTask(with: url!) { (data, resp, error) in
            do{
                self.user = try JSONDecoder().decode([User].self, from: data!)
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }catch{
                print("error al conectar")
            }
        }.resume()
    }

}

