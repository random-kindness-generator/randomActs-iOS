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
    
    func login(with user: User, completion: @escaping (Error?) -> Void) {
        
        let loginURL = baseURL.appendingPathComponent("users/login")
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
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
                if let gestures = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(gestures)
                }
                
            } catch {
                print("Error decoding Activity object: \(error)")
                completion(error)
                return
                
            }
            
            completion(nil)
            }.resume()
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
