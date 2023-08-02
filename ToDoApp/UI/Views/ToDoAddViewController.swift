//
//  ToDoSaveViewController.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 2.08.2023.
//

import UIKit

class ToDoAddViewController: UIViewController {

    @IBOutlet weak var txtToDo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSaveAct(_ sender: Any) {
        if let toDo = txtToDo.text {
            addTodo(toDo: toDo)
        }
    }
    
    func addTodo(toDo: String) {
        print("To do save : \(toDo)")
    }
    
}
