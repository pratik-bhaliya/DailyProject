//
//  DetailViewController.swift
//  MemoryLifeCycle
//
//  Created by Pratik Bhaliya on 1/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var contact:Contact!
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactLastName: UILabel!
    @IBOutlet weak var contactFirstName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactImageView.image = contact.avatar
        contactFirstName.text = contact.firstName
        contactLastName.text = contact.lastName
        contactNumber.text = contact.number.map({String(describing: $0)}) ?? ""
    }

}
