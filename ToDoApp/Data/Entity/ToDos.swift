//
//  ToDo.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 2.08.2023.
//

import Foundation

class ToDos {
    var id: Int?
    var name: String?
 
    init(){
        
    }
    
    init(id: Int? = nil, name: String? = nil) {
        self.id = id
        self.name = name
    }

    
}
