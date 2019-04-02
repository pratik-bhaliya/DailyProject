//
//  AddTaskViewController.swift
//  Todoey-CoreDataExample
//
//  Created by Pratik Bhaliya on 2/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class BuzzableTextfield: UITextField,BuzzableView {}
class BuzzableButton: UIButton,BuzzableView {}

class AddTaskViewController: UIViewController {

    @IBOutlet weak var nameTextField: BuzzableTextfield!
    @IBOutlet weak var saveButton: BuzzableButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add New Task"
        nameTextField.delegate = self
        nameTextField.becomeFirstResponder()
    }
    
    private func closeKeyboard() {
        for view in view.subviews where view.isFirstResponder {
            view.resignFirstResponder()
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        closeKeyboard()
        //Check before saving.
        guard nameTextField.text != "" else {
            nameTextField.buzz()
            saveButton.buzz()
            return
        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        guard let name = nameTextField.text else {
            fatalError("Please enter your name!")
        }
        task.name = name
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
