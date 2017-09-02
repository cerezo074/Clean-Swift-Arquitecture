//
//  LoginViewController.swift
//  CleanSwift
//
//  Created by eli on 9/2/17.
//  Copyright © 2017 Monkey Labs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet fileprivate weak var usernameTextfield: UITextField!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var signInButton: UIButton!
    
    fileprivate let presenter: LoginPresenterInterface
    fileprivate let interactor: LoginInteractorInteraface
    fileprivate let router: LoginRouter
    
    init(presenter: LoginPresenterInterface,
         interactor: LoginInteractorInteraface,
         router: LoginRouter) {
        self.presenter = presenter
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        bindLoginViewState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let username = usernameTextfield.text,
            let password = passwordTextField.text else {
                return
        }
        
        interactor.validate(username: username, password: password)
    }

}

fileprivate extension LoginViewController {

    func configureUI() {
        //Data comes from Presenter
        usernameTextfield.placeholder = presenter.usernamePlaceHolder
        //Color, Fonts
    }
    
    func bindLoginViewState() {
        presenter.loginStateBlock = { [weak self] state in
            switch state {
            case .success(let user):
                self?.showHome(with: user)
                break
            case .error(let message):
                print(message)
                self?.signInButton.isEnabled = true
                break
            case .validating:
                self?.signInButton.isEnabled = false
            default:
                return
            }
        }
    }
    
    func showHome(with user: UserViewModel) {
        print("Login was successfull")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.router.showHome(with: user)
            self.signInButton.isEnabled = true
        }
    }
    
}
