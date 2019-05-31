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
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var phoneNumberTextFieldOutlet: UITextField!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var addressTextFieldOutlet: UITextField!
    
    

    @IBAction func saveButton(_ sender: Any) {
        
        let name = nameTextFieldOutlet.text
        let notes = noteTextView.text ?? ""
        let phone = phoneNumberTextFieldOutlet.text ?? ""
        let email = emailTextFieldOutlet.text ?? ""
        let address = addressTextFieldOutlet.text ?? ""
        guard let contactName = name else { return }
        if let person = self.contact {
            let contact = Contact(id: person.id, name: contactName, phone: phone, email: email, address: address, group: "test", notes: notes, user_id: nil)
            ContactCotroller.shared.updateContactInfo(with: contact) { (error) in
               
            }
            navigationController?.popViewController(animated: true)
        } else {
        let contact = Contact(id: nil, name: contactName, phone: phone, email: email, address: address, group: "test", notes: notes, user_id: nil)
            ContactCotroller.shared.cteateContactInfo(with: contact) { (err) in
            }
            navigationController?.popViewController(animated: true)
        }
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateView()

        view.backgroundColor = ThemeHelper.customBlue
        ThemeHelper.textFieldStyle(for: nameTextFieldOutlet)
        ThemeHelper.textFieldStyle(for: phoneNumberTextFieldOutlet)
        ThemeHelper.textFieldStyle(for: emailTextFieldOutlet)
        ThemeHelper.textFieldStyle(for: addressTextFieldOutlet)
        noteTextView.layer.cornerRadius = 8.0
    }
    
    func updateView() {
        
        if let person = self.contact {
            title = person.name
            nameTextFieldOutlet.text = person.name
            noteTextView.text = person.notes
            phoneNumberTextFieldOutlet.text = person.phone
            emailTextFieldOutlet.text = person.email
            addressTextFieldOutlet.text = person.address
        }
        else {
            nameTextFieldOutlet.text = ""
            noteTextView.text = ""
            phoneNumberTextFieldOutlet.text = ""
            emailTextFieldOutlet.text = ""
            addressTextFieldOutlet.text = ""
        }
    }
    
}
