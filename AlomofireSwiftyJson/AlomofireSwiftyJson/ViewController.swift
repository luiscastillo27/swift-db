//
//  ViewController.swift
//  AlomofireSwiftyJson
//
//  Created by admin on 12/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let url = "https://jsonplaceholder.typicode.com/users"
    private var lists = [Users]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        //localData()
        externalData()
    }

    private func localData(){
        if let file = Bundle.main.path(forResource: "api", ofType: "json") {
            let data = try? Data(contentsOf: URL( fileURLWithPath: file ))
            let json = try? JSON(data: data!)
            print(json![0]["name"])
            print(json![0]["email"])
            for item in (json?.array)! {
                print(item["name"])
                print(item["email"])
            }
            //print(json!)
        } else {
            print("Se ha producido un error")
        }
    }
    
    private func externalData(){
        DispatchQueue.main.async {
            Alamofire.request(self.url).responseJSON(completionHandler: { (resp) in
                switch resp.result {
                    case .success(let value):
                        let json = JSON(value)
                        for item in json.array! {
                            let name = item["name"].stringValue
                            let email = item["email"].stringValue
                            let street = item["address"]["street"].stringValue
                            let user = Users(name: name, email: email, street: street)
                            self.lists.append(user)
                        }
                        self.table.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            })
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell( withIdentifier: "cell", for: indexPath ) as! CellViewCell
        let list = lists[indexPath.row]
        cell.name.text = list.name
        cell.email.text = list.email
        cell.street.text = list.street
        return cell
    }

}

