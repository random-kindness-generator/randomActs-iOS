//
//  ContactsTableViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    
    
    
    var contacts: [Contact] = []
    
    @IBAction func addNewContactButton(_ sender: Any) {
        
    }
    
  
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       tableView.reloadData()
        if LoginController.shared.token == nil {
          
        performSegue(withIdentifier: "loginView", sender: self)
        } else {
            ContactCotroller.shared.fetchContacts(completion: { (contacts) in
                self.contacts = contacts
                self.tableView.reloadData()
            })
        }
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        cell.textLabel?.text = "\(contacts[indexPath.row].name)"
//        if let email = contacts[indexPath.row].email {
//        cell.detailTextLabel?.text = "\(email)"
//        }
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = contacts[indexPath.row]
            ContactCotroller.shared.deleteContacts(with: contact) { (bool) in
                
            }
            contacts.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "editContact" {
            let destination = segue.destination as! ContactDetailViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        destination.contact = self.contacts[indexPath.row]
        }
    }
    

}
