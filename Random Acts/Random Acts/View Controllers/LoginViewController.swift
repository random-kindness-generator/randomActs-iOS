//
//  LoginViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passOutlet: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let username = usernameOutlet.text, !username.isEmpty,
            let password = passOutlet.text, !password.isEmpty {
//            let usernameStored = UserDefaults.standard.string(forKey: "username")
//            let passwordStored = UserDefaults.standard.string(forKey: "password")
//            if username == usernameStored {
//                if password == passwordStored {
//                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
//                    UserDefaults.standard.synchronize()
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
            let user = User(username: username, password: password, name: "", phone: "", email: "", address: "")
            LoginController.shared.login(with: user) { (token) in
                
                if token != nil {
                    ContactCotroller.shared.fetchContacts(completion: { (contacts) in
                        print(contacts)
                    })
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    self.displayMyAlertMessage(userMessage: "Login or Password do not match")
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ThemeHelper.buttonStyle(for: registerButton)
        passOutlet.layer.cornerRadius = 10.0
        usernameOutlet.layer.cornerRadius = 10.0
        view.backgroundColor = ThemeHelper.customBlue
        
        
    }
    
    
    func displayMyAlertMessage(userMessage:String) {
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: .alert);
        let okAction = UIAlertAction(title:"Ok", style: .default, handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
    }
    
}
