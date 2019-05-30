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
    private let baseURL = URL(string: "https://random-acts0519.herokuapp.com/api/")!
    var contacts: [Contact] = []
    var bearer: Bearer?
    var userId: Int?
    var pass = "$2a$10$4hAnDiNc4VCEopXIXrxHZu0RARiVfK6/cLMf/I2UJXp5hIDd.FPbq"
    
    func register(with user: User, completion: @escaping (Error?) -> Void) {
        
        let parameters = ["username" : user.username, "password" : user.password, "name" : user.name, "phone" : user.phone, "email" : user.email, "address" : user.address]
        
        let loginURL = baseURL.appendingPathComponent("register")
        let session = URLSession.shared
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
        
//            let JSONString = String(data: data, encoding: String.Encoding.utf8)
//            print(JSONString!)
       
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Int] {
                    print(json)
                    // handle json...
                    self.userId = json.first
                }
            } catch let error {
                print(error.localizedDescription)
            }
            completion(error)
        })
            task.resume()

    }
    
    func updateUserInfo(with user: User, completion: @escaping (Error?) -> Void) {
        
        guard let userId = userId else { return }
        let loginURL = baseURL.appendingPathComponent("users")
        let parameters = ["id" : "\(userId)", "username" : user.username, "password" : user.password, "name" : user.name, "phone" : user.phone, "email" : user.email, "address" : user.address]
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST" //set http method as POST
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
    func login(with user: User, completion: @escaping (Error?) -> Void) {
        
        let loginURL = baseURL.appendingPathComponent("login")
        let parameters = ["username" : user.username, "password" : user.password]
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST" //set http method as POST
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
       
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
//    func fetchGestures(completion: @escaping (Result<[String], NetworkError>) -> Void ) {
//        
//        guard let bearer = bearer else {
//            completion(.failure(.noAuth))
//            return }
//        
//        let gestureURL = baseURL.appendingPathComponent("actions")
//        
//        var request = URLRequest(url: gestureURL)
//        request.httpMethod = HTTPMethod.get.rawValue
//        request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            if let response = response as? HTTPURLResponse,
//                //REMEMBER TO CHANGE STATUS CODE
//                response.statusCode == 100 {
//                completion(.failure(.badAuth))
//                return
//            }
//            if let _ = error {
//                completion(.failure(.otherError))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.badData))
//                return
//            }
//            
//            let JSONString = String(data: data, encoding: String.Encoding.utf8)
//            print(JSONString!)
//            
//            do {
//              if let gestures = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                    print(gestures)
//                }
//            } catch {
//                NSLog("Error decoding gestures from contact object: \(error)")
//                completion(.failure(.noDecode))
//                return
//            }
//            }.resume()
//        
//    }
    
}
