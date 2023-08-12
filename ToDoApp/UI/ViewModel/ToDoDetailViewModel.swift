//
//  ToDoDetailViewModel.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 12.08.2023.
//

import Foundation

class ToDoDetailViewModel {
    
    let trepo = ToDoDaoRepository()
    
    func update(id: Int, name:String){
        trepo.update(id: id, name: name)
    }
}
