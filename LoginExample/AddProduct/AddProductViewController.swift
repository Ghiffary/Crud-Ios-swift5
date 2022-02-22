//
//  AddProductViewController.swift
//  LoginExample
//
//  Created by MacBook Air on 29/02/20.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtSku: UITextField!
    @IBOutlet weak var txtProduct: UITextField!
    
    
    @IBAction func AddProduct(_ sender: Any) {
        
        guard let sku = txtSku.text else {return}
        guard let product = txtProduct.text else {return}
        
        let ModelAddProduct = AddProductModel(title: sku, content:product)
        
        APIManager.shareInstance.callingAddProductAPI(AddProduct: ModelAddProduct) { (result) in
            switch result{
            case .success(let json):
                
                
//                let token = (json as! LoginResponeModel).token
                
                print("cuadd",json)
                
                
                
            case .failure(let err):
                print(err.localizedDescription)
                
        }
    }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Dashboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        nextViewController.modalPresentationStyle = .fullScreen
//        nextViewController.tblDashboard.reloadData()
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtSku.delegate = self
        self.txtProduct.delegate = self

        
        // Do any additional setup after loading the view.
    }
    
    //03 textfield func for the return key
        func textFieldShouldReturn(textField: UITextField) -> Bool {
//          txtField.resignFirstResponder()
            self.txtSku.resignFirstResponder()
            self.txtProduct.resignFirstResponder()
          return true;
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

        // user presses return key

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

    

    

}


