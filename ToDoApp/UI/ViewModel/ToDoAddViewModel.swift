//
//  ToDoAddViewModel.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 12.08.2023.
//

import Foundation

class ToDoAddViewModel {
    let trepo = ToDoDaoRepository()
    
    func addTodo(toDo: String) {
        trepo.addTodo(toDo: toDo)
    }

}
