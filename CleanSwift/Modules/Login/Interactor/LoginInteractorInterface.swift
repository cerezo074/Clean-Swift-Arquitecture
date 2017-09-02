//
//  LoginInteractorInterface.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation

protocol LoginInteractorOutPutDelegate {
    func loginWasSuccess(with user: UserProtocol)
    func loginError(with errorMessage: String)
    func onValdation()
}

protocol LoginInteractorInteraface {
    var delegate: LoginInteractorOutPutDelegate? { get set }
    func validate(username: String, password: String)
}
