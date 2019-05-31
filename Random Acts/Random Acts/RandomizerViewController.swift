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


    override func viewDidLoad() {
        super.viewDidLoad()

        changeButtonImage()
        view.backgroundColor = ThemeHelper.customPink
        contactNameLabel.text = " "
        goodWillButton.layer.cornerRadius = 20.0
        gestureTextView.layer.cornerRadius = 8.0
        



    }

    private func changeButtonImage() {

        let logo = UIImage(named: "heartLogo")
        goodWillButton.setImage(logo, for: .normal)


    }


    @IBAction func goodWillButtonTapped(_ sender: Any) {


    }

    



}
