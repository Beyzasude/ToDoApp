//
//  ToDoSaveViewController.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 2.08.2023.
//

import UIKit

class ToDoAddViewController: UIViewController {

    @IBOutlet weak var txtToDo: UITextField!
    
    var viewModel = ToDoAddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSaveAct(_ sender: Any) {
        if let toDo = txtToDo.text {
            viewModel.addTodo(toDo: toDo)
        }
    }
}
