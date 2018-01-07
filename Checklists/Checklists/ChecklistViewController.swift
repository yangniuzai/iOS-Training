//
//  ViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/11/26.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    
    //var items: [ChecklistItem]
    var checklist: Checklist!
    
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinischAdding item: ChecklistItem) {
        
        let newRowIndex = checklist.items.count
        checklist.items.append(item) //add content to data model
        
        let indexPath = IndexPath (row: newRowIndex, section:0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        dismiss(animated: true, completion: nil)
        //saveChecklistitems() //save the item to data path
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinischEditing item: ChecklistItem) {
        
       
        if let index = checklist.items.index(of: item) {
        let indexPath = IndexPath (row: index, section:0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
      //  saveChecklistitems()
    }
    
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        //1
        if segue.identifier == "AddItem"
        {//2
            let navigationController = segue.destination as! UINavigationController
        //3
            let controller = navigationController.topViewController as! ItemDetailViewController
            //4
            controller.delegate = self
        }
        
        else if segue.identifier == "EditItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
        
    }
  
   /* required init?(coder aDecoder : NSCoder) {
       
        checklist.items = [ChecklistItem] ()
        super.init(coder: aDecoder)
        loadChecklistItems()
//print("Documtns folder is \(documentsDirectory())")
 //       print("data file path is \(dataFilePath())")
 
    }
 */
 
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = checklist.items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item) // default value of checkmark
        return cell
    }

    //select the row to toggle checkmark
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
           
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
          configureCheckmark(for: cell, with: item)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
       // saveChecklistitems()
    }
    
    //"swipe to delete" function
  override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
       //1
        checklist.items.remove(at:indexPath.row)
        //2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
     //   saveChecklistitems()
    }
    
    
    //config checkmark value:
    func configureCheckmark (for cell: UITableViewCell,
                             with item: ChecklistItem) {
        
      let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configureText(for cell: UITableViewCell,
                       with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as!UILabel
        label.text = item.text
        
    }
   
}


