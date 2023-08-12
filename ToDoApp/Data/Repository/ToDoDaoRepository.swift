//
//  ToDoDaoRepository.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 12.08.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepository {
    
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    func addTodo(toDo: String) {
        print("To do save : \(toDo)")
    }
    
    func update(id: Int, name:String){
        print("Update To Do: \(id) - \(name)")
    }
    
    func delete(id: Int){
        print("Delete To Do: \(id)")
    }
    
    func search(searchWord: String){
        print("Search To Do: \(searchWord)")
    }
    
    func uploadToDos(){
        var list = [ToDos]()
        
        let t1 = ToDos(id: 1, name: "Buy movie tickets for friday")
        let t2 = ToDos(id: 2, name: "Buy gift for mom")
        let t3 = ToDos(id: 3, name: "Call Suzie")
        
        list.append(t1)
        list.append(t2)
        list.append(t3)
        
        toDoList.onNext(list) // Tetikleme
    }
}
