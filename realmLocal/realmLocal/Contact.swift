//
//  Contact.swift
//  realmLocal
//
//  Created by Luis on 12/17/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var year = 0
    @objc dynamic var phone: String? = nil
    @objc dynamic var id = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
