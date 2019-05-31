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
    var userId: Int?
    var token: String?
    
  
    
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
    
    
    
    func fetchContacts(completion: @escaping ([Contact]) -> Void ) {
        
        guard let userId = self.userId else { return }
        guard let token = self.token else { return }
        
        let gestureURL = baseURL.appendingPathComponent("users").appendingPathComponent("\(userId)").appendingPathComponent("contacts")
        
        var request = URLRequest(url: gestureURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
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
                let decodedTeam = try jsonDecoder.decode([Contact].self, from: data)
//                print(decodedTeam)
                
//                if let contacts = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Contact] {
//                    print(contacts)
                self.contacts = decodedTeam
                completion(decodedTeam)
                
            } catch {
                NSLog("Error decoding gestures from contact object: \(error)")
                
                return
            }
            }.resume()
        
    }
    
    func cteateContactInfo(with contact: Contact, completion: @escaping (Error?) -> Void) {
        
        guard let userId = self.userId else { return }
        
      
        let parameters = ["name" : contact.name, "address" : contact.address!, "group" : "", "notes" : contact.notes!, "phone" : contact.phone!, "email" : contact.email!, "user_id" : userId] as [String : Any]
        
        
        let loginURL = baseURL.appendingPathComponent("contacts")
        
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
    
    func updateContactInfo(with contact: Contact, completion: @escaping (Error?) -> Void) {
        
        guard let userId = self.userId else { return }
        guard let id  = contact.id else { return }
        
        let parameters = ["name" : contact.name, "address" : contact.address!, "group" : contact.group!, "notes" : contact.notes!, "phone" : contact.phone!, "email" : contact.email!, "user_id" : userId] as [String : Any]
        
        
        let loginURL = baseURL.appendingPathComponent("contacts").appendingPathComponent("\(id)")
        //create the session object
        let session = URLSession.shared
        var request = createRequest(url: loginURL, httpMethod: "PUT")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
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
    
}
