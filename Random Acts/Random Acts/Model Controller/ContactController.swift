//
//  ContactController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation


class ContactCotroller {
    
    
    static let shared = ContactCotroller()
    private let baseURL = URL(string: "https://random-acts0519.herokuapp.com/api/contacts/")
    var contacts: [Contact] = []
    
    
    
}
