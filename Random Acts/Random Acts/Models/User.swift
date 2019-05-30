//
//  User.swift
//  Random Acts
//
//  Created by Diante Lewis-Jolley on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation


struct User: Codable {

        let id: Int? = nil
        let username, password: String
        let name, phone: String?
        let email, address: String?
    }

