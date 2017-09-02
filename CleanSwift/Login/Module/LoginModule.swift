//
//  LoginModule.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation
import UIKit

struct LoginModule {
    
    static func loadModule(with baseNavigation: UIViewController) -> UIViewController {
        
        let signInImplementator = SignInCaseUseImplementator()
        let loginInteractor = LoginInteractor(signInImplementator: signInImplementator)
        let loginPresenter = LoginPresenter()
        let loginRouter = LoginRouter(baseNavigation: baseNavigation)
        let loginView = LoginViewController(presenter: loginPresenter,
                                            interactor: loginInteractor,
                                            router: loginRouter)
        
        loginInteractor.delegate = loginPresenter
        
        return loginView
    }
    
}
