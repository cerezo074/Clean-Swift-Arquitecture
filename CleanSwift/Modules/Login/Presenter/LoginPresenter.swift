//
//  LoginPresenter.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterInterface {

    fileprivate var loginState: LoginState = .idle
    
    var loginStateBlock: LoginViewStateBlock?
    
    var usernamePlaceHolder: String {
        return "Introduce tu email"
    }
    
}

extension LoginPresenter: LoginInteractorOutPutDelegate {

    func loginError(with errorMessage: String) {
        loginState = .error(message: errorMessage)
        loginStateBlock?(loginState)
    }
    
    func loginWasSuccess(with user: UserProtocol) {
        var userViewModel = UserViewModel(with: user)
        userViewModel.greeting = "Welcome to Clean Swift example"
        
        loginState = .success(user: userViewModel)
        loginStateBlock?(loginState)
    }
    
    func onValdation() {
        loginState = .validating
        loginStateBlock?(loginState)
    }
    
}
