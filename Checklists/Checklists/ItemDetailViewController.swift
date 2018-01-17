//
//  itemDetailViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/12/12.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel (_ controller: ItemDetailViewController)
    func itemDetailViewController (_ controller: ItemDetailViewController,
                                didFinischAdding item: ChecklistItem)
    func itemDetailViewController (_ controller: ItemDetailViewController,
                                didFinischEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    var itemToEdit : ChecklistItem?
    var dueDate = Date()
    weak var delegate: ItemDetailViewControllerDelegate?
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
     @IBOutlet weak var dueDateLabel: UILabel!
    @IBAction func cancell() {
        delegate?.itemDetailViewControllerDidCancel(self)
      //  dismiss(animated: true, completion: nil)
    }
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinischEditing: item)
        } else {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.itemDetailViewController(self, didFinischAdding: item)
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
           // doneBarButton.isEnabled = true
        }
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
//class itemDetailViewController: UITableViewController,



