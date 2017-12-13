//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/12/12.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel (_ controller: AddItemViewController)
    func addItemViewController (_ controller: AddItemViewController,
                                didFinischAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    weak var delegate: AddItemViewControllerDelegate?
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBAction func cancell() {
        delegate?.addItemViewControllerDidCancel(self)
      //  dismiss(animated: true, completion: nil)
    }
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.addItemViewController(self, didFinischAdding: item)
        
     //   dismiss(animated: true, completion: nil)
    }
    
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
        
            doneBarButton.isEnabled = (newText.length > 0)
        
        return true
    }
}
//class AddItemViewController: UITableViewController,



