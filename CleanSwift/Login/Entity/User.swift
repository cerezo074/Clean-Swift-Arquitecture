//
//  User.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation

protocol UserProtocol {
    var name: String { get }
    var lastname: String { get }
    var email: String { get }
}

struct UserConstants {
    static let name = "name"
    static let lastname = "lastname"
    static let email = "email"
}

struct User: UserProtocol {
    
    var name: String = ""
    var lastname: String =  ""
    var email: String = ""
    
    init(dict: [String : Any]) {
        
        if let name = dict[UserConstants.name] as? String {
            self.name = name
        }
        
        if let lastname = dict[UserConstants.lastname] as? String {
            self.lastname = lastname
        }
        
        if let email = dict[UserConstants.email] as? String {
            self.email = email
        }
    }
}
