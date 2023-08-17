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
    
    let db: FMDatabase?
    
    init() {
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("ToDosApp.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func addTodo(toDo: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO toDos (name) VALUES (?)", values: [toDo])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func update(id: Int, name:String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE toDos SET name = ? WHERE id = ? ", values: [name, id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func delete(id: Int){
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM toDos WHERE id = ?", values: [id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func search(searchWord: String){
        db?.open()
        var liste = [ToDos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE name LIKE '%\(searchWord)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                
                let toDo = ToDos(id: id, name: name)
                liste.append(toDo)
            }
            toDoList.onNext(liste)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func uploadToDos(){
        db?.open()
        var liste = [ToDos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM toDos ", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                
                let toDo = ToDos(id: id, name: name)
                liste.append(toDo)
            }
            toDoList.onNext(liste)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
