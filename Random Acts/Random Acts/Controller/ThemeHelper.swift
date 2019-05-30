//
//  ThemeHelper.swift
//  Random Acts
//
//  Created by Diante Lewis-Jolley on 5/30/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation
import UIKit


enum ThemeHelper {

    static let customBlue = UIColor(displayP3Red: 172/255, green: 206/255, blue: 233/255, alpha: 0.08)

    static let customYellow = UIColor(displayP3Red: 209/255, green: 166/255, blue: 57/255, alpha: 1.0)

    static func setupAppearance() {

        UINavigationBar.appearance().barTintColor = customBlue
        UIBarButtonItem.appearance().tintColor = .white
        
        



        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
    }

    static func buttonStyle(for button: UIButton) {

        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = customYellow
        button.layer.cornerRadius = 10.0

    }

    static func textFieldStyle(for textField: UITextField) {

        textField.layer.cornerRadius = 10.0
        
    }



}
