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
    @IBOutlet weak var noteTextFieldOutlet: UITextField!
    @IBOutlet weak var phoneNumberTextFieldOutlet: UITextField!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var addressTextFieldOutlet: UITextField!
    
    

    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateView()

        view.backgroundColor = ThemeHelper.customBlue
    }
    
    func updateView() {
        
        if let person = self.contact {
            
            nameTextFieldOutlet.text = person.name
            noteTextFieldOutlet.text = person.notes
            phoneNumberTextFieldOutlet.text = person.phone
            emailTextFieldOutlet.text = person.email
            addressTextFieldOutlet.text = person.address
        }
        else {
            nameTextFieldOutlet.text = ""
            noteTextFieldOutlet.text = ""
            phoneNumberTextFieldOutlet.text = ""
            emailTextFieldOutlet.text = ""
            addressTextFieldOutlet.text = ""
        }
    }
    
}
