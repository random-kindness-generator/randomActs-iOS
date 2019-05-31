//
//  ActionController.swift
//  Random Acts
//
//  Created by Sergey Osipyan on 5/31/19.
//  Copyright © 2019 Random Acts. All rights reserved.
//

import Foundation


class ActionController {
    
    static let shared = ActionController()
    private let baseURL = URL(string: "https://random-acts0519.herokuapp.com/api/")!
    var actions: [Activity] = []
    var userId: Int?
    var token: String?
    
    
    
    
    func createRequest(url: URL, httpMethod: String) -> URLRequest {
        var request = URLRequest(url: url)
        if let token = self.token {
            request.httpMethod = httpMethod
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //        request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(token, forHTTPHeaderField: "Authorization")
            return request
        }
        return request
    }
    
    
    
    func fetchActions(completion: @escaping ([Activity]) -> Void ) {
        
        
        
        let gestureURL = baseURL.appendingPathComponent("actions")
        
        let request = createRequest(url: gestureURL, httpMethod: "GET")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            
            let JSONString = String(data: data, encoding: String.Encoding.utf8)
            print(JSONString!)
            
            do {
                
                let jsonDecoder = JSONDecoder()
                let decodedTeam = try jsonDecoder.decode([Activity].self, from: data)
                //                print(decodedTeam)
                
                //                if let contacts = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Contact] {
                //                    print(contacts)
                self.actions = decodedTeam
                completion(decodedTeam)
                
            } catch {
                NSLog("Error decoding gestures from contact object: \(error)")
                
                return
            }
            }.resume()
        
    }
    
    func createAction(with action: String, completion: @escaping (Error?) -> Void) {
        let parameters = ["action" : action]
        
        let loginURL = baseURL.appendingPathComponent("actions")
        
        //create the session object
        let session = URLSession.shared
        var request = createRequest(url: loginURL, httpMethod: "POST")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
        })
        task.resume()
    }
    
    func updateAction(with action: Activity, completion: @escaping (Error?) -> Void) {
        
        let parameters = ["action" : action.action]
        
        
        let loginURL = baseURL.appendingPathComponent("actions").appendingPathComponent("\(action.id)")
        //create the session object
        let session = URLSession.shared
        var request = createRequest(url: loginURL, httpMethod: "PUT")
        
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
            
            if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                print(JSONString)
            }
            
            
        })
        task.resume()
        
    }
    
    func deleteAction(with action: Activity, completion: @escaping (Bool) -> Void ) {
        let gestureURL = baseURL.appendingPathComponent("actions").appendingPathComponent("\(action.id)")
        
        let request = createRequest(url: gestureURL, httpMethod: "DELETE")
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print(error)
                return
            }
            }.resume()
        
    }
}
