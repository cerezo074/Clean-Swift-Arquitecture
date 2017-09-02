//
//  LoginInteractor.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation
import UIKit

class LoginInteractor: LoginInteractorInteraface {
    
    fileprivate var signInImplementator: SignInCaseUseProtocol
    
    init(signInImplementator: SignInCaseUseProtocol) {
        self.signInImplementator = signInImplementator
    }
    
    var delegate: LoginInteractorOutPutDelegate?
    
    func validate(username: String, password: String) {
        guard username.characters.count != 0,
            password.characters.count != 0 else {
                delegate?.loginError(with: "Sorry email and password can not be empty")
                return
        }
        
        delegate?.onValdation()
        
        signInImplementator.signIn(with: username,
                                   password: password) { [weak self] (user) in
                                    guard let user = user else {
                                        self?.delegate?.loginError(with: "Invalid credentials")
                                        return
                                    }
                                    
                                    self?.delegate?.loginWasSuccess(with: user)
        }
    }
    
}
