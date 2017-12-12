//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/12/12.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBAction func cancell() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func done() {
        print("Contents of the text filed: \(textField.text!)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String)-> Bool{
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string)
            as NSString
        if newText.length > 0 {
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }
        return true
    }
}
//class AddItemViewController: UITableViewController,



