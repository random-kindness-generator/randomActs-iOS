//
//  ActsOfServiceTableViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit

class ActsOfServiceTableViewController: UITableViewController {

    
    var actions: [Activity] = []
    
    @IBAction func addNewGestureButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ThemeHelper.customBlue
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ActionController.shared.fetchActions { (actions) in
            self.actions = actions
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gestureCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = actions[indexPath.row].action
        cell.layer.cornerRadius = 8.0
        
        
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let action = actions[indexPath.row]
            ActionController.shared.deleteAction(with: action) { (bool) in
                
            }
            actions.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editGesture" {
            let destination = segue.destination as! GestureDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            destination.action = self.actions[indexPath.row]
        }
    }
    
}
