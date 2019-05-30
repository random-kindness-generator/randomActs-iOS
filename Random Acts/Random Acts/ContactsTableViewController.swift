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
//    var user: User = User(username: "test", password: "1234")
    
    
    
    
    @IBAction func addNewContactButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
       
            
        }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if !isUserLoggedIn {
        performSegue(withIdentifier: "loginView", sender: self)
        }
        // Log out button action
//        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
//        UserDefaults.standard.synchronize()
//        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        cell.textLabel?.text = contacts[indexPath.row].name

        style(cell: cell)

        return cell
    }


    private func style(cell: UITableViewCell) {
        cell.textLabel?.backgroundColor = .clear
        cell.detailTextLabel?.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        cell.backgroundColor = ThemeHelper.customBlue

        cell.layer.cornerRadius = 8.0
    }

    private func setupAppearance() {

        view.backgroundColor = ThemeHelper.customBlue
        tableView.backgroundColor = ThemeHelper.customBlue
        tableView.tableHeaderView?.backgroundColor = ThemeHelper.customBlue
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
