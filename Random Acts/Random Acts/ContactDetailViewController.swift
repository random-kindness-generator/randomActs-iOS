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
        
        let name = nameTextFieldOutlet.text
        let notes = noteTextFieldOutlet.text ?? ""
        let phone = phoneNumberTextFieldOutlet.text ?? ""
        let email = emailTextFieldOutlet.text ?? ""
        let address = addressTextFieldOutlet.text ?? ""
        guard let contactName = name else { return }
        let contact = Contact(id: nil, name: contactName, phone: phone, email: email, address: address, group: nil, notes: notes, userID: nil)
        ContactCotroller.shared.cteateUpdateContactInfo(with: contact) { (err) in
            print("here")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateView()
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
