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
        listArray.append("test1"); listArray.append("test2"); listArray.append("test3")
        
        
        
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
        
        //first, check to see if the cell has data or is empty. If empty allow input
        if tableView.cellForRow(at: indexPath)?.textLabel?.text?.isEmpty == true {
            ifSelectedRowIsEmpty(at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)    //this makes highlight go away after clicking on cell
        
        //This accesses the checkmark Accessory (in storyboard Attribute insp) and makes it appear and disappear to show something has been selected or deselected.
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }//end accessory if/else
        
    }//end didSelectRowAt
    
    func ifSelectedRowIsEmpty (at: IndexPath){
        
    }
    
    
    

}//end class

