//
//  ViewController.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 2.08.2023.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnDetailAct(_ sender: Any) {
        let toDo = ToDos(id: 1, name: "Buy movie tickets for friday")
        performSegue(withIdentifier: "toDetail", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let toDo = sender as? ToDos{
                let vc = segue.destination as! ToDoDetailViewController
                vc.toDo = toDo
            }
        }
    }
}

