//
//  Contacts.swift
//  Random Acts
//
//  Created by Diante Lewis-Jolley on 5/28/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation


struct Contact: Codable {

    var firstName: String
    var lastName: String
    var phoneNumber: Int?
    var emailAddress: String?
    var gesture: String

}
