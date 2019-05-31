//
//  GestureDetailViewController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import UIKit

class GestureDetailViewController: UIViewController {

    var action: Activity?
    
    @IBOutlet weak var gestureTextViewOutlet: UITextView!
    
    
    @IBAction func saveButton(_ sender: Any) {
        guard let gestureText = gestureTextViewOutlet.text else { return }
        
        if let gesture = self.action {
            let updatedGesture = Activity(id: gesture.id, action: gestureText)
            ActionController.shared.updateAction(with: updatedGesture) { (err) in }
            navigationController?.popViewController(animated: true)
        } else {
            ActionController.shared.createAction(with: gestureText) { (err) in }
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ThemeHelper.customBlue
        gestureTextViewOutlet.layer.cornerRadius = 10.0

        
        if let gesture = self.action {
            gestureTextViewOutlet.text = gesture.action
        } else {
            gestureTextViewOutlet.text = ""
        }
    }

}
