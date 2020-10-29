//
//  ViewController.swift
//  MVVMExample
//
//  Created by 권민재 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageLabel.isHidden = true
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func loginUser() {
        self.messageLabel.isHidden = true
        guard let userName = self.userNameField.text else { return }
        guard let password = self.passwordField.text else { return }
        viewModel.authenticationUser(userName, password)
        
        viewModel.loginCompletion { [weak self] status, message in
            guard let self = self else { return }
            if status {
                self.messageLabel.text = "login success"
                self.messageLabel.isHidden = false
            } else {
                self.messageLabel.text = message
                self.messageLabel.isHidden = false
            }
        }
    }
    
    
    
}
