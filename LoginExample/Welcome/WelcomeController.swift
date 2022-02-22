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
        
       
    
}
    
}
