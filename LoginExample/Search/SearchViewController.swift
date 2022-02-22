//
//  SearchViewController.swift
//  LoginExample
//
//  Created by MacBook Air on 29/02/20.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    

    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var tblSearch: UITableView!
    @IBOutlet weak var txtSearchBar: UITextField!
    @IBOutlet weak var txtSku: UILabel!
    
    var ModelSearch1 = SearchModel()
    var sku: String = ""
    var ModelSerach = [ResponseSearchModel]()
    var skuResponse: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func apiCall() {
        
        let APIManager = APIManager()
//        APIManager.getSearchData()
//        let SM = ModelSearch1
//        self.txtSku.text = SM.title
//        print("search hasil", SM.title)
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        
//        apiCall()
        guard let skuS = txtSearchBar.text else {return}
        
        
//        let modelSearch = SearchModel(title: title)
        
        APIManager.shareInstance.callingSearchAPI(id: skuS) { (result) in
            switch result{
            case .success(let json):

                let sku = (json as! SearchModel).title
//                self.skuResponse = sku
                self.txtSku.text = sku

                print("cukako",sku)

            case .failure(let err):
                print("error search",err.localizedDescription)

        }

        }
        
    }
    
    
    
    
    
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
