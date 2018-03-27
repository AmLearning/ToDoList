/*
 Original VC converted to TableViewController by inheritance (name change optional, but for clarity, did so) and assigning this as the class for the TableViewController in the storyboard.
 NO @IBOutlet needed to connect the table, as it is prepackaged into the TVC.
 */

import UIKit

class ToDoListViewController: UITableViewController {
    
    var listArray = [String]()  //array to hold cell data (ToDos)
    

    
//oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
    override func viewDidLoad() {
        super.viewDidLoad()
        //since using TableViewController, no need to set self as delegate for TableViewDelegate and TableViewDataSource
        
        //at the start, populate array to test things out
        //listArray.append("test1"); listArray.append("test2"); listArray.append("test3")
        
        
        loadData()
    }
//oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooodf
    
    
    
    
    //MARK: - TableView DataSource Methods:  two required.  cellForRowAt and numberOfRowsInSection
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Here, we cast to the CustomMessageCell type because using the custom cell....since default prototype, no cast as in Chat.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.textLabel?.text = listArray[indexPath.row]
        
        return cell
    }//end cellForRowAt
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    
    //MARK: - TableView Delegate Methods:
    //this functon detects which row user selects
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print ("row \(indexPath) selected")
        
        tableView.deselectRow(at: indexPath, animated: true)    //this makes highlight go away after clicking on cell
        
        //This accesses the checkmark Accessory (in storyboard Attribute insp) and makes it appear and disappear to show something has been selected or deselected.
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }//end accessory if/else
        
    }//end didSelectRowAt
    
    
    //MARK: - ADD NEW ITEM TO LIST
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        addNewItem()
    }
    
    func addNewItem (){
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type in New Item Here"
            textField = alertTextField
        }//end addTextField
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let userInput = textField.text {
                self.listArray.append(userInput)
                self.tableView.reloadData()
                self.saveData()
            }else {
                print ("nothing entered")
            }//end if-else
            
        }//end action
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)

    }//end addNewItem
    
    
    //MARK: - save data in UserDefault
    func saveData (){
        let defaults = UserDefaults.standard
        
        defaults.set(listArray, forKey: "listArrayData")
    }
    
    
    //MARK: - load UserDefaults
    func loadData (){
        let defaults = UserDefaults.standard
        
        if let list = defaults.array(forKey: "listArrayData") as? [String]{
            listArray = list
        }
    }

}//end class

