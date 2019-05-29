//
//  LoginController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation



private func getHeaders() -> [String: String] {
    let userName = "xxxx"
    let password = "xxxx"
    let credentialData = "\(userName):\(password)".data(using: .utf8)
    guard let cred = credentialData else { return ["" : ""] }
    let base64Credentials = cred.base64EncodedData(options: [])
    guard let base64Date = Data(base64Encoded: base64Credentials) else { return ["" : ""] }
    return ["Authorization": "Basic \(base64Date.base64EncodedString())"]
}
