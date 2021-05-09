//
//  ViewController.swift
//  MyToDoList
//
//  Created by Amir Hossein on 2/18/1400 AP.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let userDefaulf = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "helllllll"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "heloooooo"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "heliiiiii"
        itemArray.append(newItem2)
                
        if let items = userDefaulf.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
    }
    
//MARK - tableView Datasource methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)

        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        return cell
    }
    
//MARK - tableView delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.tableView.reloadData()
    }
    
    
//MARK - Bar Button Item (Add New Item)
    
    
    
    @IBAction func addbuttonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            
            //what while happen after user tap on the add button
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.userDefaulf.setValue(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Craat new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

