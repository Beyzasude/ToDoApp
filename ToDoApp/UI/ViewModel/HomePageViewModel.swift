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
        toDoList = trepo.toDoList
    }
    
    func delete(id: Int){
        trepo.delete(id: id)
    }
    
    func search(searchWord: String){
        trepo.search(searchWord: searchWord)
    }
    
    func uploadToDos(){
        trepo.uploadToDos()
    }
}
