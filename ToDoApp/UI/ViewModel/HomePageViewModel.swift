//
//  HomePageViewModel.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 12.08.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    
    var trepo = ToDoDaoRepository()
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init(){
        databaseCopy()
        toDoList = trepo.toDoList
    }
    
    func delete(id: Int){
        trepo.delete(id: id)
        trepo.uploadToDos()
    }
    
    func search(searchWord: String){
        trepo.search(searchWord: searchWord)
    }
    
    func uploadToDos(){
        trepo.uploadToDos()
    }
    
    func databaseCopy(){
        let bundlePath = Bundle.main.path(forResource: "ToDosApp", ofType: ".sqlite")
        
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("ToDosApp.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: databaseURL.path()){
            print("Veritabanı zaten var.")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: databaseURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
