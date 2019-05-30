////
////  RandomActsController.swift
////  Random Acts
////
////  Created by Diante Lewis-Jolley on 5/29/19.
////  Copyright © 2019 Random Acts. All rights reserved.
////
//
//import Foundation
//
//enum HTTPMethod: String {
//
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case get = "GET"
//}
//
//enum NetworkError: Error {
//
//    case noAuth
//    case badAuth
//    case otherError
//    case badData
//    case noDecode
//}
//
//class RandomActsController {
//
//    // MUST FIND BASE URL
//    private let baseURL = URL(string: " ")!
//    var bearer: Bearer?
//
//
//    func register(with user: User, completion: @escaping (Error?) -> Void) {
//
//        let registerURL = baseURL.appendingPathComponent("users/register")
//
//        var urlRequest = URLRequest(url: registerURL)
//        urlRequest.httpMethod = HTTPMethod.post.rawValue
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let encoder = JSONEncoder()
//
//        do {
//            let data = try encoder.encode(user)
//            urlRequest.httpBody = data
//
//        } catch {
//            print("Error encoding User object")
//            completion(error)
//            return
//
//        }
//
//        URLSession.shared.dataTask(with: urlRequest) { (_, response, error) in
//            if let response = response as? HTTPURLResponse,
//
//                //  INCORRECT STATUS CODE/ MUST FIND STATUS CODE TO MATCH
//                response.statusCode != 100 {
//                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
//                return
//            }
//
//            if let error = error {
//                completion(error)
//                return
//            }
//
//            completion(nil)
//        }.resume()
//    }
//
//    func login(with user: User, completion: @escaping (Error?) -> Void) {
//
//        let loginURL = baseURL.appendingPathComponent("users/login")
//
//        var request = URLRequest(url: loginURL)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let encoder = JSONEncoder()
//
//        do {
//            let data = try encoder.encode(user)
//            request.httpBody = data
//
//        } catch {
//            print("Error encoding user for Login")
//            completion(error)
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let response = response as? HTTPURLResponse,
//
//                // AGAIN THIS IS THE INCORRECT STATUS CODE/ NEED STATUS CODE TO MATCH
//                response.statusCode != 100 {
//                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
//                return
//            }
//
//            if let error = error {
//                completion(error)
//                return
//            }
//
//            guard let data = data else {
//                completion(NSError())
//                return
//            }
//
//            let decoder = JSONDecoder()
//
//            do {
//                self.bearer = try decoder.decode(Bearer.self, from: data)
//
//            } catch {
//                print("Error decoding Activity object: \(error)")
//                completion(error)
//                return
//
//            }
//
//            completion(nil)
//        }.resume()
//    }
//
//
//    func fetchGestures(completion: @escaping (Result<[String], NetworkError>) -> Void ) {
//
//        guard let bearer = bearer else {
//            completion(.failure(.noAuth))
//            return }
//
//        let gestureURL = baseURL.appendingPathComponent("actions")
//
//        var request = URLRequest(with: gestureURL)
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
//            let decoder = JSONDecoder()
//
//            do {
//                let gestures = try decoder.decode(Activity.self, from: data)
//                completion(.success(gestures))
//
//            } catch {
//                NSLog("Error decoding gestures from contact object: \(error)")
//                completion(.failure(.noDecode))
//                return
//            }
//        }.resume()
//
//    }
//
//
//
//
//
//
//
//}
