//
//  SignInUseCaseImplementator.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation
import UIKit

class SignInCaseUseImplementator: SignInCaseUseProtocol {
    
    let apiRest = APIRest()
    
    func signIn(with userImage: UIImage, completion: (UserProtocol?) -> Void) {
        
    }
    
    func signIn(with telephoneNumber: String, completion: (UserProtocol?) -> Void) {
        
    }
    
    func signIn(with username: String, password: String, completion: (UserProtocol?) -> Void) {
        //Server Logic
        let responseIsOk = username == "faustino93" && password == "12345"
        
        //If user is correct return a complete json, otherwise object is emtpy
        apiRest.makeRequest(shouldGetUser: responseIsOk) { (jsonDict) in
            guard let jsonDict = jsonDict else {
                completion(nil)
                return
            }
            
            let user = User(dict: jsonDict)
            completion(user)
        }
        //Server Login end
    }
    
}

class APIRest {

    typealias JSONSuccessResponseBlock = ([String : Any]?) -> Void
    
    private let successResponse: [String : Any] = [
            "name" : "Faustino",
            "lastname" : "Asprilla",
            "email" : "eltinoasprilla@gmail.com"
        ]
    
    func makeRequest(shouldGetUser: Bool, completion: JSONSuccessResponseBlock) {
        //go to internet
        //fetch payload
        //return payload on success(HTTP 200) or failure block(HTTP 400 or 500)
        completion(shouldGetUser ? successResponse : nil)
    }
    
}
