//
<<<<<<< HEAD
//  LoginController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/29/19.
=======
//  RandomActsController.swift
//  Random Acts
//
//  Created by Diante Lewis-Jolley on 5/29/19.
>>>>>>> 605c3dfef7f43559fd78c1f478966b78103cd510
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation

<<<<<<< HEAD


private func getHeaders() -> [String: String] {
    let userName = "xxxx"
    let password = "xxxx"
    let credentialData = "\(userName):\(password)".data(using: .utf8)
    guard let cred = credentialData else { return ["" : ""] }
    let base64Credentials = cred.base64EncodedData(options: [])
    guard let base64Date = Data(base64Encoded: base64Credentials) else { return ["" : ""] }
    return ["Authorization": "Basic \(base64Date.base64EncodedString())"]
=======
enum HTTPMethod: String {

    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum NetworkError: Error {

    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class RandomActsController {

    // MUST FIND BASE URL
    private let baseURL = URL(string: " ")!
    var activity: Activity?


    func register(with user: User, completion: @escaping (Error?) -> Void) {

        let registerURL = baseURL.appendingPathComponent("users/register")

        var urlRequest = URLRequest(url: registerURL)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(user)
            urlRequest.httpBody = data

        } catch {
            print("Error encoding User object")
            completion(error)
            return

        }

        URLSession.shared.dataTask(with: urlRequest) { (_, response, error) in
            if let response = response as? HTTPURLResponse,

                //  INCORRECT STATUS CODE/ MUST FIND STATUS CODE TO MATCH
                response.statusCode != 100 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }

            if let error = error {
                completion(error)
                return
            }

            completion(nil)
        }.resume()
    }

    func login(with user: User, completion: @escaping (Error?) -> Void) {

        let loginURL = baseURL.appendingPathComponent("users/login")

        var request = URLRequest(url: loginURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(user)
            request.httpBody = data

        } catch {
            print("Error encoding user for Login")
            completion(error)
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,

                // AGAIN THIS IS THE INCORRECT STATUS CODE/ NEED STATUS CODE TO MATCH
                response.statusCode != 100 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }

            if let error = error {
                completion(error)
                return
            }

            guard let data = data else {
                completion(NSError())
                return
            }

            let decoder = JSONDecoder()

            do {
                self.activity = try decoder.decode(Activity.self, from: data)

            } catch {
                print("Error decoding Activity object: \(error)")
                completion(error)
                return

            }

            completion(nil)
        }.resume()
    }







>>>>>>> 605c3dfef7f43559fd78c1f478966b78103cd510
}
