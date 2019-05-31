//
//  RandomizerViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit

class RandomizerViewController: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var goodWillButton: UIButton!
    @IBOutlet weak var gestureTextView: UITextView!

    var contacts: [Contact] = []
    var actions: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeTitleImage()
        view.backgroundColor = ThemeHelper.customPink
        contactNameLabel.text = " "
        goodWillButton.layer.cornerRadius = 8.0
        gestureTextView.layer.cornerRadius = 8.0
        goodWillButton.backgroundColor = .clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ContactCotroller.shared.fetchContacts { (contacts) in
            self.contacts = contacts
        }
        ActionController.shared.fetchActions { (actions) in
            self.actions = actions
        }
    }

    private func changeTitleImage() {

        let logo = UIImage(named: "heartLogo")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView


    }


    @IBAction func goodWillButtonTapped(_ sender: Any) {
        
        let index = Int(arc4random_uniform(UInt32(contacts.count)))
        contactNameLabel.text = contacts[index].name
        
        let actionIndex = Int(arc4random_uniform(UInt32(actions.count)))
        gestureTextView.text = actions[actionIndex].action
    }

    



}
