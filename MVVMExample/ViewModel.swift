//
//  ViewModel.swift
//  MVVMExample
//
//  Created by 권민재 on 2020/10/29.
//

import Foundation


class ViewModel: NSObject {
    
    var user: User!
    var userName: String { return user.name }
    var email: String { return user.email }
    
    typealias authenticationLoginCallback = (_ status: Bool, _ message: String) -> Void
    
    var callback: authenticationLoginCallback?
    
    func authenticationUser(_ email: String, _ password: String) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            if self.userName.count != 0 {
                if password.count != 0 {
                    self.verifyUser(self.userName, password)
                }else {
                    self.callback?(false, "password error")
                }
            }else {
                self.callback?(false, "user error")
            }
        }
    }
    
    func verifyUser(_ email: String, _ password: String) {
        if userName == "test" && password == "1234" {
            user = User(name: userName, email: "\(userName)@gmail.com")
            self.callback?(true, "success")
        }else {
            self.callback?(false, "Please enter valid source")
        }
    }
    
    func loginCompletion(callBack: @escaping authenticationLoginCallback) {
        self.callback = callBack
    }
    
}
