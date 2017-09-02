//
//  LoginRouter.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import Foundation
import UIKit

struct LoginRouter {
    
    fileprivate weak var baseNavigation: UIViewController?
    
    init(baseNavigation: UIViewController) {
        self.baseNavigation = baseNavigation
    }
    
    func showHome(with user: UserViewModel) {
        guard let navigationController = baseNavigation as? UINavigationController else {
            print("Error can not navigate from login to home without a navigation contoller")
            return
        }
        
        //TODO: CALL HOME LOADER FUCNTION
        let homeViewInitializedWithAllElements = HomeViewController(userViewModel: user)
        navigationController.pushViewController(homeViewInitializedWithAllElements,
                                                animated: true)
    }
    
}
