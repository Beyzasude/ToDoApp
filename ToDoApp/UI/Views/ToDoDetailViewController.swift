//
//  ToDoDetailViewController.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 2.08.2023.
//

import UIKit

class ToDoDetailViewController: UIViewController {

    @IBOutlet weak var txtToDo: UITextField!
    var toDo: ToDos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = toDo{
            txtToDo.text = td.name
        }

    }

    @IBAction func btnUpdateAct(_ sender: Any) {
        if let toDoName = txtToDo.text, let td = toDo{
            update(id: td.id!, name: toDoName)
        }
        
    }
    
    func update(id: Int, name:String){
        print("Update To Do: \(id) - \(name)")
    }
    
}
