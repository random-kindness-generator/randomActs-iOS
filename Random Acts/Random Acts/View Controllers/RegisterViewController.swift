//
//  RegisterViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit

enum LoginType {
    
    case register
    case login
}

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
 
    

    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        if let username = loginTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let repeatPassword = repeatPasswordTextField.text, !repeatPassword.isEmpty {
            if password != repeatPassword { displayMyAlertMessage(userMessage: "Passwords do not match")}
            let user = User(username: username, password: password, name: nameTextField.text ?? "", phone: phoneNumberTextField.text ?? "", email: emailTextField.text ?? "", address: addressTextField.text ?? "")
            
                ContactCotroller.shared.register(with: user) { (error) in
                    if user.username != nil {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Sign up Successful", message: "Now please log in.", preferredStyle: .alert)
                            
                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                                UserDefaults.standard.set(username, forKey: "username")
                                UserDefaults.standard.set(password, forKey: "password")
                                UserDefaults.standard.synchronize()
                                self.dismiss(animated: true, completion: nil)
                            })
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: {
                            
                            })
                        }
                    }
                    }
        } else {
            displayMyAlertMessage(userMessage: "Marked fields are required")
        }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func displayMyAlertMessage(userMessage:String) {
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: .alert);
        let okAction = UIAlertAction(title:"Ok", style: .default, handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
    }

}
