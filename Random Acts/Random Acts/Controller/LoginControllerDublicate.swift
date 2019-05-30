//
//
//import Foundation
//
//class LoginController1 {
//       
//    
//    
//    // MUST FIND BASE URL
//    private let baseURL = URL(string: " ")!
//    
//    var activity: Activity?
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
//            }.resume()
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
//                self.activity = try decoder.decode(Activity.self, from: data)
//                
//            } catch {
//                print("Error decoding Activity object: \(error)")
//                completion(error)
//                return
//                
//            }
//            
//            completion(nil)
//            }.resume()
//    }
//    
//}