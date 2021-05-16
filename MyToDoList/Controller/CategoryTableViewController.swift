//
//  CategoryTableViewController.swift
//  MyToDoList
//
//  Created by Amir Hossein on 2/21/1400 AP.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategoryItems()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryItemCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let destVC = segue.destination as! ToDoListViewController

            if let indexPath = tableView.indexPathForSelectedRow {

                destVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    // MARK: - Add New Category
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController.init(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "add item ", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            
            self.saveCategory()
        }
        
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Add new Category"
            textField = alertTextfield
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Data Manipulation Function
    
    func loadCategoryItems(){
        
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(request)
        }catch{
            print("Error")
        }
    }
    
    func saveCategory(){
        
        do {
            try context.save()
        }catch{
            print("Error")
        }
        
        self.tableView.reloadData()
    }
    
}
