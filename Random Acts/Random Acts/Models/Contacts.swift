//
//  Contacts.swift
//  Random Acts
//
//  Created by Diante Lewis-Jolley on 5/28/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

//import Foundation
//
//
//struct Contact: Codable {
//
//    var name: String
//    var phone: String?
//    var email: String?
//    var address: String?
//    var group: String?
//    var notes: String?
//    var user_id: Int
//
//
//
//}


import Foundation

// MARK: - Contact
struct Contact: Codable {
    let id: Int?
    let name: String
    let phone, email, address: String?
    let group, notes: String?
    let userID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, phone, email, address, group, notes
        case userID = "user_id"
    }
}

