//
//  MemoryTableViewCell.swift
//  MemoryLifeCycle
//
//  Created by Pratik Bhaliya on 1/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class MemoryTableViewCell: UITableViewCell {
    var contact : Contact? {
        didSet{
            textLabel?.text = contact.map({ String(describing: $0)}) ?? " "
        }
    }
}
