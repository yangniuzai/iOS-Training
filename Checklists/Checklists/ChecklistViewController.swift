//
//  ViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/11/26.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var row0item : ChecklistItem
    var row1item : ChecklistItem
    var row2item : ChecklistItem
    var row3item : ChecklistItem
    var row4item : ChecklistItem
 
    
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
        return 5
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0item.text
        } else if indexPath.row == 1 {
            label.text = row1item.text
        } else if indexPath.row == 2{
            label.text = row2item.text
        } else if indexPath.row == 3 {
            label.text = row3item.text
        } else if indexPath.row == 4 {
            label.text = row4item.text
        }
        configureCheckmark(for: cell, at: indexPath) // default value of checkmark
        return cell
    }
    //config checkmark value
    func configureCheckmark (for cell: UITableViewCell,
                             at indexPath: IndexPath) {
        var isChecked = false
        if indexPath.row == 0 {
            isChecked = row0item.checked
        } else if indexPath.row == 1 {
            isChecked = row1item.checked
        } else if indexPath.row == 2 {
            isChecked = row2item.checked
        } else if indexPath.row == 3 {
            isChecked = row3item.checked
        } else if indexPath.row == 4 {
            isChecked = row4item.checked
        }
        if isChecked {
        cell.accessoryType = .checkmark
         } else {
          cell.accessoryType = .none
         }
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            var isChecked = false
            
            if indexPath.row == 0 {
                row0item.checked = !row0checked
                isChecked = row0checked
            } else if indexPath.row == 1 {
                row1item.checked = !row1checked
                isChecked = row1checked
            } else if indexPath.row == 2 {
                row2item.checked = !row2checked
                isChecked = row2checked
            } else if indexPath.row == 3 {
                row3item.checked = !row3checked
                isChecked = row3checked
            } else if indexPath.row == 4 {
                row4item.checked = !row4checked
                isChecked = row4checked
            }
            
            if isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
   
    }
}


