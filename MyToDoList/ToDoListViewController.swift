//
//  ViewController.swift
//  MyToDoList
//
//  Created by Amir Hossein on 2/18/1400 AP.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemcArray = ["hi","hello","hola"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK - tableView Datasource methods
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemcArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)
        cell.textLabel?.text = itemcArray[indexPath.row]
        return cell
    }
      
    //MARK - tableView delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemcArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            tableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator

        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

