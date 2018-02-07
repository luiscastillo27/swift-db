//
//  Usuarios.swift
//  firestore
//
//  Created by Luis on 06/02/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation

class Usuarios {
    
    var nombre: String?
    var apellido: String?
    var id: String?
    init( nombre:String?, apellido:String?, id:String? ) {
        self.nombre = nombre
        self.apellido = apellido
        self.id = id
    }
    
}
