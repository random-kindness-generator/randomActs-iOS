//
//  ContactDetailViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController, UITextFieldDelegate {

    var contact: Contact?
    
    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    @IBOutlet weak var lastNameTextFieldOutlet: UITextField!
    @IBOutlet weak var phoneNumberTextFieldOutlet: UITextField!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    
    

    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        
        if let conatct = self.contact {
        
        nameTextFieldOutlet.text = contact?.firstName
        lastNameTextFieldOutlet.text = contact?.lastName
//        phoneNumberTextFieldOutlet.text = contact?.phoneNumber
        emailTextFieldOutlet.text = contact?.emailAddress
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
