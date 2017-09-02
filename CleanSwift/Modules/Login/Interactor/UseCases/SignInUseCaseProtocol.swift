//
//  SignInUseCaseProtocol.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation
import UIKit

typealias UserDataBlock = (_ user: UserProtocol?) -> Void

protocol SignInCaseUseProtocol {
    func signIn(with username: String, password: String, completion: UserDataBlock)
    func signIn(with userImage: UIImage, completion: UserDataBlock)
    func signIn(with telephoneNumber: String, completion: UserDataBlock)
}
