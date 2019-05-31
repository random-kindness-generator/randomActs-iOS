//
//  LoginViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var passwordLabel: UILabel!

    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loggedInButton: UIButton!
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passOutlet: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    
    @IBAction func loginButton(_ sender: Any) {
        
        if let username = usernameOutlet.text, !username.isEmpty,
            let password = passOutlet.text, !password.isEmpty {
            let usernameStored = UserDefaults.standard.string(forKey: "username")
            let passwordStored = UserDefaults.standard.string(forKey: "password")
            if username == usernameStored {
                if password == passwordStored {
                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                    UserDefaults.standard.synchronize()
                    self.dismiss(animated: true, completion: nil)
                }
            }
            let user = User(username: username, password: password, name: "", phone: "", email: "", address: "")
            ContactCotroller.shared.login(with: user) { (err) in
                
                if let error = err {
                    print(error)
                    self.displayMyAlertMessage(userMessage: "Login or Password do not match")
                } else {
                    
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        view.backgroundColor = ThemeHelper.customBlue


    }

  override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //animateBackgroundColor()
    }

    private func setupAppearance() {

        ThemeHelper.buttonStyle(for: registerButton)
        ThemeHelper.buttonStyle(for: loggedInButton)
        passOutlet.layer.cornerRadius = 8.0
        usernameOutlet.layer.cornerRadius = 8.0
        view.backgroundColor = ThemeHelper.customBlue
        loginLabel.textColor = .white
        emailLabel.textColor = .white
        passwordLabel.textColor = .white
        orLabel.textColor = .white

    }


    private func animateBackgroundColor() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.repeat,.autoreverse], animations: {
            self.view.backgroundColor = ThemeHelper.customBlue
            self.view.backgroundColor = ThemeHelper.customGold
        }, completion: nil)


    }
    
    
    func displayMyAlertMessage(userMessage:String) {
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: .alert);
        let okAction = UIAlertAction(title:"Ok", style: .default, handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
    }
    
}
