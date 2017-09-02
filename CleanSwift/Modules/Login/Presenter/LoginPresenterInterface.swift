//
//  LoginPresenterInterface.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation

enum LoginState {
    case success(user: UserViewModel)
    case error(message: String)
    case validating
    case idle
}

struct UserViewModel {
    var username: String = ""
    var greeting: String = ""
    
    init(with user: UserProtocol) {
        username = user.name + " " + user.lastname
    }
    
    var completeGreeting: String {
        return greeting + " " + username
    }
}

typealias LoginViewStateBlock = (LoginState) -> Void

protocol LoginPresenterInterface: class {
    
    var usernamePlaceHolder: String { get }
    var loginStateBlock: LoginViewStateBlock? { get set }
    
}
