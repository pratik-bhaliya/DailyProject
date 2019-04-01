//
//  CreateContactViewController.swift
//  MemoryLifeCycle
//
//  Created by Pratik Bhaliya on 1/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

protocol CreateContactViewControllerDelegate: class {
    func newContactViewController(_ newContactViewController: CreateContactViewController, created: Contact)
    func newContactViewControllerDidCancel(_ newContactViewController: CreateContactViewController)
}

class CreateContactViewController: UIViewController {

    weak var delegate: CreateContactViewControllerDelegate?

    @IBOutlet weak var girlSelected: UIImageView!
    @IBOutlet weak var maleSelected: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var countryCodeTextField: UITextField!
    var genderInfo = "unknown"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maleSelected.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstNameTextField.becomeFirstResponder()
    }
    
    @IBAction func maleAction(_ sender: UIButton) {
        if girlSelected.isHidden == false {
            girlSelected.isHidden = true
            maleSelected.isHidden = false
        }
        genderInfo = "boy"
    }
    
    @IBAction func femaleAction(_ sender: UIButton) {
        if maleSelected.isHidden == false {
            maleSelected.isHidden = true
            girlSelected.isHidden = false
        }
        genderInfo = "girl"
    }
    
    private func closeKeyboard() {
        for view in view.subviews where view.isFirstResponder {
            view.resignFirstResponder()
        }
    }
    
    @IBAction func save(_ sender: Any) {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let countryCode = countryCodeTextField.text,
            let phoneNumber = phoneNumberTextField.text,
            firstName != "" || lastName != "" else {
                return
        }
        closeKeyboard()
        let contactInfo = Contact(firstName: firstName, lastName: lastName, avatar: genderInfo)
        let numberInfo = Number(countryCode: countryCode, numberString: phoneNumber, contact: contactInfo)
        contactInfo.number = numberInfo
        delegate?.newContactViewController(self, created: contactInfo)
    }
    
    @IBAction func cancel(_ sender: Any) {
        closeKeyboard()
        delegate?.newContactViewControllerDidCancel(self)
    }
}

extension CreateContactViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            countryCodeTextField.becomeFirstResponder()
        case countryCodeTextField:
            phoneNumberTextField.becomeFirstResponder()
        case phoneNumberTextField:
            save(self)
        default:
            break
        }
        return true
    }
}
