//
//  UpdateDeleteViewController.swift
//  LoginExample
//
//  Created by MacBook Air on 20/02/22.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import UIKit

class UpdateDeleteViewController: UIViewController {
    
    
    var UD_id: Int = 0
    var UD_title: String = ""
    var UD_content: String = ""
    
    @IBOutlet weak var txtId: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtContent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtId.text = String(UD_id)
        self.txtTitle.text = UD_title
        self.txtContent.text = UD_content
        print("UD_id",UD_id)
        print("UD_title", UD_title)
        print("UD_content",UD_content)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func UpdateButton(_ sender: Any) {
        
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "UpdateDelete", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.U_id = self.UD_id ?? 0
        nextViewController.U_title = self.UD_title ?? ""
        nextViewController.U_content = self.UD_content ?? ""
        
        
        
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func DeleteButton(_ sender: Any) {
        
         let title = self.UD_title
        let content = self.UD_content


        let modelDelete = DeleteModel(title: title, content: content)

        APIManager.shareInstance.callingDeleteAPI(id: String(self.UD_id), delete: modelDelete) { (result) in
            switch result{
            case .success(let json):

                let sku = (json as! ResponseDeleteModel).title


                print("cukakoDelete",sku)
                self.dismiss(animated: true, completion: nil)

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
