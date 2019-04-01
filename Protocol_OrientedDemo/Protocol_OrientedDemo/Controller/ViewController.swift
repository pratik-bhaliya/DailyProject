//
//  ViewController.swift
//  Protocol_OrientedDemo
//
//  Created by Pratik Bhaliya on 1/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class BuzzablePoppableErrorMessage: UILabel, Buzzable,Popable {}
class BuzzableButton: UIButton, Buzzable {}
class BuzzableTextfield: UITextField, Buzzable {}

class ViewController: UIViewController {

    @IBOutlet weak var errorMessage: BuzzablePoppableErrorMessage!
    @IBOutlet weak var loginButton: BuzzableButton!
    @IBOutlet weak var password: BuzzableTextfield!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func Login(_ sender: Any) {
        password.buzz()
        loginButton.buzz()
        errorMessage.buzz()
        errorMessage.pop()
    }
}

