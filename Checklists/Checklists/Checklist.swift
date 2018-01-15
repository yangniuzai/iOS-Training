//
//  Checklist.swift
//  Checklists
//
//  Created by Qingyu Yang on 2017/12/23.
//  Copyright © 2017年 Qingyu Yang. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding  {
    var name = ""
    var items = [ChecklistItem]()
    var iconName: String
    
    init(name: String, iconName: String){
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    convenience init(name: String) {
        self.init(name : name, iconName : "No Icon")
    }
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [ChecklistItem]
        iconName = aDecoder.decodeObject(forKey: "IconName") as! String
        
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
        aCoder.encode(items, forKey: "IconName")
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
