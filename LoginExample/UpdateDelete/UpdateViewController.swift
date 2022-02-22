//
//  UpdateViewController.swift
//  LoginExample
//
//  Created by MacBook Air on 20/02/22.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtSku: UITextField!
    @IBOutlet weak var txtProduct: UITextField!
    
    var U_id: Int = 0
    var U_title: String = ""
    var U_content: String = ""
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.txtSku.text = self.U_title
        self.txtProduct.text = self.U_content
        
        
        self.txtSku.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
//          txtField.resignFirstResponder()
        self.txtSku.resignFirstResponder()
//        self.txtQty.resignFirstResponder()
//        self.txtUnit.resignFirstResponder()
//        self.txtPrice.resignFirstResponder()
//        self.txtStatus.resignFirstResponder()
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
    
    
    

    @IBAction func UpdataProuctButton(_ sender: Any) {
        
        guard let title = txtSku.text else {return}
        guard let content = txtProduct.text else {return}
        
        let ModelUpdateProduct = UpdateProductModel(title: title, content: content)
        
        APIManager.shareInstance.callingUpdateProductAPI(id: String(U_id), UpdateProduct: ModelUpdateProduct) { (result) in
            switch result{
            case .success(let json):
                
                
                
                print("cuadd",json)
                
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Dashboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                
                nextViewController.modalPresentationStyle = .fullScreen
        //        nextViewController.tblDashboard.reloadData()
                self.present(nextViewController, animated:true, completion:nil)
                
                
            case .failure(let err):
                print(err.localizedDescription)
                
        }
    }
        
        
        
        
        
    }
    
    @IBAction func CancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextView: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        if text.last == "\n" { //Check if last char is newline
            text.removeLast() //Remove newline
            textView.resignFirstResponder() //Dismiss keyboard
        }
    }
}
