//
//  User.swift
//  jsonRequest
//
//  Created by admin on 12/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let address: Addres
}
