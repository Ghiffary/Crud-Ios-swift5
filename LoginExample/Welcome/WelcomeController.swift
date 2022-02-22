//
//  LoginViewControler.swift
//  LoginExample
//
//  Created by MacBook Air on 29/02/20.
//  Copyright © 2022 Ghiffary. All rights reserved.//

import Foundation
import UIKit
import XCTest

class WelcomeController: UIViewController {
    
//    @IBOutlet weak var emailTxt: UITextField!
//    @IBOutlet weak var passwordTxt: UITextField!
    @IBAction func ContinueView(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Dashboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
    
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func Continue(_ sender: Any) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Dashboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
    
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
        
        
        
//        guard let email = emailTxt.text else {return}
//        guard let password = passwordTxt.text else {return}
//
//        let modelLogin = LoginModel(email: email, password: password)
            
//        APIManager.shareInstance.callingLoginAPI(login: modelLogin) { (result) in
//            switch result{
//            case .success(let json):
//
//                let token = (json as! LoginResponeModel).token
//
//                print("cuko",token)
//
//                let storyBoard : UIStoryboard = UIStoryboard(name: "Dashboard", bundle:nil)
//                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
//                nextViewController.token = token
//                nextViewController.modalPresentationStyle = .fullScreen
//                self.present(nextViewController, animated:true, completion:nil)
//
//            case .failure(let err):
//                print(err.localizedDescription)
//
//        }
//    }
    
}
    
}
