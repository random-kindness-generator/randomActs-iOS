//
//  LoginViewController.swift
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

class LoginViewController: UIViewController {


    
    @IBOutlet weak var emailAddressOutlet: UITextField!
    @IBOutlet weak var passOutlet: UITextField!
    // must be connected!!!
    @IBOutlet weak var loginSegmentedControl: UISegmentedControl!
    // must be connected !!!
    @IBOutlet weak var registerButton: UIButton!

    var loginController: RandomActController?
    var loginType = LoginType.register

    

    @IBAction func loginButton(_ sender: Any) {

        guard let loginController = loginController else { return }
        if let username = emailAddressOutlet.text, !username.isEmpty,
            let password = passOutlet.text, !password.isEmpty {
            let user = User(username: username, password: password)

            if loginType == .register {
            loginController.register(with: user) { (error) in
                    if let error = error {
                        print("Error occured during sign up: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Sign up Successful", message: "Now please log in.", preferredStyle: .alert)

                            let alertAction = UIAlertAction(title: "OK", style: .default , handler: nil)

                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: {
                                self.loginType = .signIn
                                self.loginSegmentedControl.selectedSegmentIndex = 1
                                self.signInButton.setTitle("Login", for: .normal)
                            })
                        }
                    }
                }
            } else {
                loginController.logIn(with: user) { (error) in
                    if let error = error {
                        print("Error occured during sign in: \(error)")

                    } else {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerButton.layer.cornerRadius = 8.0

    }

    // Must be connected
    @IBAction func loginTypeChanged(_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0 {
            loginType = .register
            registerButton.setTitle("Register Now", for: .normal)
        } else {
            loginType = .loginType
            registerButton.setTitle("Login", for: .normal)
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
