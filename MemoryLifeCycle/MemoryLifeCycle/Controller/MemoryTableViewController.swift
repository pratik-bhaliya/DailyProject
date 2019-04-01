//
//  MemoryTableViewController.swift
//  MemoryLifeCycle
//
//  Created by Pratik Bhaliya on 1/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class MemoryTableViewController: UITableViewController {

    var database = Database.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! MemoryTableViewCell
        
        cell.contact = database.contacts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
            database.contacts.remove(at: indexPath.row)
        }
    }


    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifirer = segue.identifier else { return }
        
        switch identifirer {
        case "showDetailVC":
            if let contactCell = sender as? MemoryTableViewCell,
                let detalViewController = segue.destination as? DetailViewController {
                detalViewController.contact = contactCell.contact
            }
        
        case "createSegue":
            if let navCon = segue.destination as? UINavigationController,
                let createViewController = navCon.topViewController as? CreateContactViewController {
                createViewController.delegate = self
            }
        default:
            break
        }
    }
    
}

extension MemoryTableViewController: CreateContactViewControllerDelegate {
    func newContactViewController(_ newContactViewController: CreateContactViewController, created: Contact) {
        let insertIndexPath = IndexPath(row: 0, section: 0)
        
        newContactViewController.dismiss(animated: true) {
            self.tableView.scrollToRow(at: insertIndexPath, at: .top, animated: true)
            self.database.contacts.insert(created, at: insertIndexPath.row)
            self.tableView.insertRows(at: [insertIndexPath], with: .automatic)
        }
    }
    
    func newContactViewControllerDidCancel(_ newContactViewController: CreateContactViewController) {
        newContactViewController.dismiss(animated: true, completion: nil)
    }
}
