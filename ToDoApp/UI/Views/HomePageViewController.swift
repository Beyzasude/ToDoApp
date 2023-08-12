//
//  ViewController.swift
//  ToDoApp
//
//  Created by Beyza Sude Erol on 2.08.2023.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var toDoList = [ToDos]()
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        _ = viewModel.toDoList.subscribe(onNext: {liste in
            self.toDoList = liste
            self.toDoTableView.reloadData()
        })
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadToDos()
    }
    
    /*@IBAction func btnDetailAct(_ sender: Any) {
        let toDo = ToDos(id: 1, name: "Buy movie tickets for friday")
        performSegue(withIdentifier: "toDetail", sender: toDo)
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let toDo = sender as? ToDos{
                let vc = segue.destination as! ToDoDetailViewController
                vc.toDo = toDo
            }
        }
    }
}

extension HomePageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchWord: searchText)
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoCell
        
        cell.lblToDoName.text = toDo.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true) // seçin kaldırma
    }
    
    //left - start - leading
    //right- end- trailing
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ contextualAction, view, bool in
            let toDo = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Deletion process", message: "Do you want to delete \(toDo.name!)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let acceptAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                self.viewModel.delete(id: toDo.id!)
            }
            alert.addAction(acceptAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    

}
