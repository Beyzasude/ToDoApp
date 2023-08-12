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
    var viewModel = ToDoDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = toDo{
            txtToDo.text = td.name
        }
    }

    @IBAction func btnUpdateAct(_ sender: Any) {
        if let toDoName = txtToDo.text, let td = toDo{
            viewModel.update(id: td.id!, name: toDoName)
        }
    }
}
