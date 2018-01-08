//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Qingyu Yang on 2018/1/8.
//  Copyright © 2018年 Qingyu Yang. All rights reserved.
//

import UIKit
protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}

class IconPickerViewController : UITableViewController {
    
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = ["No Icon", "Appointments", "Birthday" ]
}
