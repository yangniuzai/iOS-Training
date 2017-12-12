//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/12/12.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit
class AddItemViewController: UITableViewController {
    @IBAction func cancell() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func done() {
        print("Contents of the text filed: \(textField.text!)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
