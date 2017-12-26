//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/12/8.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import Foundation
class ChecklistItem : NSObject, NSCoding {
    
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    
    override init(){
    super.init()
    }
}
