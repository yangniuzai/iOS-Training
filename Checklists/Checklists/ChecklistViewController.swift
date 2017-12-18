//
//  ViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/11/26.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var items: [ChecklistItem]
    
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinischAdding item: ChecklistItem) {
        
        let newRowIndex = items.count
        items.append(item) //add content to data model
        
        let indexPath = IndexPath (row: newRowIndex, section:0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        //1
        if segue.identifier == "AddItem"
        {//2
            let navigationController = segue.destination as! UINavigationController
        //3
            let controller = navigationController.topViewController as! AddItemViewController
            //4
            controller.delegate = self
        }
        
        else if segue.identifier == "EditItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddItemViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
        
    }
  
    required init?(coder aDecoder : NSCoder) {
        items = [ChecklistItem] ()
        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()

        row1item.text = "Walk the dog"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        
        row2item.text = "Walk the dog"
        row2item.checked = false
        items.append(row2item)
        
      
        
        super.init(coder : aDecoder)

        
    }
   
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item) // default value of checkmark
        return cell
    }

    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
           
            let item = items[indexPath.row]
            item.toggleChecked()
          configureCheckmark(for: cell, with: item)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
   
    }
    
    
  override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
       //1
        items.remove(at:indexPath.row)
        //2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
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


